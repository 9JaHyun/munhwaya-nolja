package com.munhwa.prj.withdraw.web;

import com.munhwa.prj.withdraw.api.OpenBankUtil;
import com.munhwa.prj.withdraw.dto.AccountTransferRequestDto;
import com.munhwa.prj.withdraw.dto.AccountTransferResponseDto;
import com.munhwa.prj.withdraw.dto.AuthorizationResponseDto;
import com.munhwa.prj.withdraw.dto.BankAcountSearchResponseDto;
import com.munhwa.prj.withdraw.dto.BankTokenRequestDto;
import com.munhwa.prj.withdraw.dto.BankTokenResponseDto;
import com.munhwa.prj.withdraw.service.OpenBankService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Slf4j
@Controller
public class WithdrawController {

    private final OpenBankService openBankService;
    private final OpenBankUtil openBankUtil;

    public WithdrawController(OpenBankService openBankService,
          OpenBankUtil openBankUtil) {
        this.openBankService = openBankService;
        this.openBankUtil = openBankUtil;
    }

    @GetMapping("/withdraw")
    public String testIndex() {
        return "withdraw/withdraw";
    }

    @GetMapping("/auth/openbank")
    public String receive(@ModelAttribute AuthorizationResponseDto responseDto,
          RedirectAttributes rAttr) {
        BankTokenRequestDto dto = new BankTokenRequestDto();
        dto.setCode(responseDto.getCode());
        BankTokenResponseDto tokenDto = openBankService.requestToken(dto);
        rAttr.addAttribute("token", tokenDto);
        return "redirect:../transfer";
    }

    @GetMapping("/transfer")
    public String openTransfer(Model model, RedirectAttributes rAttr) {
        BankTokenResponseDto token = (BankTokenResponseDto) rAttr.getAttribute("token");

        BankAccountSearchRequestDto searchRequestDto = new BankAccountSearchRequestDto();
        searchRequestDto.createDtoByToken(token);

        BankAcountSearchResponseDto account = openBankService.findAccount(searchRequestDto);
        model.addAttribute("bankAccounts", account);
//        model.addAttribute("useCode", useCode);
        return "withdraw/transferForm";
    }

    @PostMapping("/transfer")
    public @ResponseBody
    AccountTransferResponseDto transfer(String access_token,
          AccountTransferRequestDto accountTransferRequestDto) {
        return openBankService.accountTransfer(access_token, accountTransferRequestDto);
    }
}
