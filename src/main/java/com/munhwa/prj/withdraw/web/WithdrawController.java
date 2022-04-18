package com.munhwa.prj.withdraw.web;

import com.munhwa.prj.withdraw.api.OpenBankUtil;
import com.munhwa.prj.withdraw.dto.AccountTransferRequestDto;
import com.munhwa.prj.withdraw.dto.AccountTransferResponseDto;
import com.munhwa.prj.withdraw.dto.AuthorizationResponseDto;
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

    @ResponseBody
    @GetMapping("/auth/openbank")
    public void receive(@ModelAttribute AuthorizationResponseDto responseDto) {
        BankTokenRequestDto dto = new BankTokenRequestDto();
        dto.setCode(responseDto.getCode());
        BankTokenResponseDto tokenResponseDto = openBankService.requestToken(dto);
        log.info("getTokenResult = {}", tokenResponseDto);
    }

    @GetMapping("/transfer")
    public String openTransfer(Model model, String bank_tran_id, String access_token,
          String fintech_use_num, String account_num, String req_client_name) {
        /**
         * 20000, 100000원만 등록되어있음
         */
        //계좌번호 마스킹된값 제거(계좌번호 보여주는건 계약된 사용자만가능(그래서 마스킹된 3자리 잘라서 보내주고 클라이언트에서 3자리 더해줌
        model.addAttribute("token", access_token);
        model.addAttribute("transferForm",
              new AccountTransferRequestDto(openBankUtil.getRandomNumber(bank_tran_id),
                    fintech_use_num, req_client_name,
                    openBankUtil.trimAccountNum(account_num, account_num.length()),
                    openBankUtil.trimAccountNum(account_num, account_num.length())));
        return "withdraw/transferForm";
    }

    @PostMapping("/transfer")
    public @ResponseBody
    AccountTransferResponseDto transfer(String access_token,
          AccountTransferRequestDto accountTransferRequestDto) {
        return openBankService.accountTransfer(access_token, accountTransferRequestDto);
    }
}
