package com.munhwa.prj.withdraw.service;

import com.munhwa.prj.withdraw.api.OpenBankApiClient;
import com.munhwa.prj.withdraw.dto.AccountTransferRequestDto;
import com.munhwa.prj.withdraw.dto.AccountTransferResponseDto;
import com.munhwa.prj.withdraw.dto.BankAcountSearchResponseDto;
import com.munhwa.prj.withdraw.dto.BankTokenRequestDto;
import com.munhwa.prj.withdraw.dto.BankTokenResponseDto;
import com.munhwa.prj.withdraw.web.BankAccountSearchRequestDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor
@Service
public class OpenBankService {

    private final OpenBankApiClient openBankApiClient;

    public BankTokenResponseDto requestToken(BankTokenRequestDto bankTokenRequestDTO) {
        return openBankApiClient.requestToken(bankTokenRequestDTO);
    }

    public AccountTransferResponseDto accountTransfer(String access_token,
          AccountTransferRequestDto accountTransferRequestDto) {
        return openBankApiClient.requestTransfer(access_token, accountTransferRequestDto);
    }

    public BankAcountSearchResponseDto findAccount(
          BankAccountSearchRequestDto bankAccountSearchRequestDto){
        return openBankApiClient.requestAccountList(bankAccountSearchRequestDto);
    }

}
