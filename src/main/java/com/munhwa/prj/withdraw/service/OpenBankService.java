package com.munhwa.prj.withdraw.service;

import org.springframework.stereotype.Service;

import com.munhwa.prj.withdraw.api.OpenBankApiClient;
import com.munhwa.prj.withdraw.dto.AccountSearchRequestDto;
import com.munhwa.prj.withdraw.dto.AccountTransferRequestDto;
import com.munhwa.prj.withdraw.dto.AccountTransferResponseDto;
import com.munhwa.prj.withdraw.dto.BankAcountSearchResponseDto;
import com.munhwa.prj.withdraw.dto.BankBalanceRequestDto;
import com.munhwa.prj.withdraw.dto.BankBalanceResponseDto;
import com.munhwa.prj.withdraw.dto.BankReponseToken;
import com.munhwa.prj.withdraw.dto.BankRequestToken;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class OpenBankService {

    private final OpenBankApiClient openBankApiClient;
    public BankReponseToken requestToken(BankRequestToken bankRequestToken){
        return openBankApiClient.requestToken(bankRequestToken);
    }
    public BankAcountSearchResponseDto findAccount(AccountSearchRequestDto accountSearchRequestDto){
       return openBankApiClient.requestAccountList(accountSearchRequestDto);
    }
    public BankBalanceResponseDto findBalance(String access_token, BankBalanceRequestDto bankBalanceRequestDto){
        return openBankApiClient.requestBalance(bankBalanceRequestDto,access_token);
    }
    public AccountTransferResponseDto accountTransfer(String access_token, AccountTransferRequestDto accountTransferRequestDto){
        return openBankApiClient.requestTransfer(access_token,accountTransferRequestDto);
    }

}
