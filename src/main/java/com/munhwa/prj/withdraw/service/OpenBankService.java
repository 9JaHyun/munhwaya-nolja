package com.munhwa.prj.withdraw.service;

import org.springframework.stereotype.Service;

import com.munhwa.prj.withdraw.api.OpenBankApiClient;
import com.munhwa.prj.withdraw.dto.AccountSearchRequestDto;
import com.munhwa.prj.withdraw.dto.AccountTransferRequestDto;
import com.munhwa.prj.withdraw.dto.AccountTransferResponseDto;
import com.munhwa.prj.withdraw.dto.BankAcountSearchResponseDto;
import com.munhwa.prj.withdraw.dto.BankTokenResponseDto;
import com.munhwa.prj.withdraw.dto.BankTokenRequestDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class OpenBankService {

    private final OpenBankApiClient openBankApiClient;

    public BankTokenResponseDto requestToken(BankTokenRequestDto bankTokenRequestDTO) {
        return openBankApiClient.requestToken(bankTokenRequestDTO);
    }

    public BankAcountSearchResponseDto findAccount(
          AccountSearchRequestDto accountSearchRequestDto) {
        return openBankApiClient.requestAccountList(accountSearchRequestDto);
    }

    public AccountTransferResponseDto accountTransfer(String access_token,
          AccountTransferRequestDto accountTransferRequestDto) {
        return openBankApiClient.requestTransfer(access_token, accountTransferRequestDto);
    }

}
