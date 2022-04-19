package com.munhwa.prj.withdraw.api;

import com.munhwa.prj.common.propertyScan.service.PropertiesScan;
import com.munhwa.prj.withdraw.dto.AccountTransferRequestDto;
import com.munhwa.prj.withdraw.dto.AccountTransferResponseDto;
import com.munhwa.prj.withdraw.dto.BankAcountSearchResponseDto;
import com.munhwa.prj.withdraw.dto.BankTokenRequestDto;
import com.munhwa.prj.withdraw.dto.BankTokenResponseDto;
import com.munhwa.prj.withdraw.web.BankAccountSearchRequestDto;
import java.util.Properties;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;


@Slf4j
@Service
public class OpenBankApiClient {

    private final OpenBankUtil openBankutil;
    private final HttpHeaders httpHeaders;
    private final RestTemplate restTemplate;
    private final PropertiesScan propertiesScan;

    private final String REDIRECT_URL = "http://localhost/prj/auth/openbank";
    private final String BASE_URL = "https://testapi.openbanking.or.kr";
    private final String USE_CODE;
    private final String CLIENT_ID;
    private final String CLIENT_SECRET;

    public OpenBankApiClient(OpenBankUtil openBankutil,
          HttpHeaders httpHeaders, RestTemplate restTemplate,
          PropertiesScan propertiesScan) {
        this.openBankutil = openBankutil;
        this.httpHeaders = httpHeaders;
        this.restTemplate = restTemplate;
        this.propertiesScan = propertiesScan;

        Properties properties = propertiesScan.readProperties("config/openbanking.properties");
        USE_CODE = properties.getProperty("useCode");
        CLIENT_ID = properties.getProperty("client_id");
        CLIENT_SECRET = properties.getProperty("client_secret");
    }

    // 토큰 발급 요청
    public BankTokenResponseDto requestToken(BankTokenRequestDto bankTokenRequestDto) {
        httpHeaders.add("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8");
        bankTokenRequestDto.setBankRequestToken(CLIENT_ID, CLIENT_SECRET, REDIRECT_URL,
              "authorization_code");
        MultiValueMap<String, String> parameters = new LinkedMultiValueMap<>();
        parameters.add("code", bankTokenRequestDto.getCode());
        parameters.add("client_id", bankTokenRequestDto.getClient_id());
        parameters.add("client_secret", bankTokenRequestDto.getClient_secret());
        parameters.add("redirect_uri", bankTokenRequestDto.getRedirect_uri());
        parameters.add("grant_type", bankTokenRequestDto.getGrant_type());

        HttpEntity<MultiValueMap<String, String>> param = new HttpEntity<>(parameters, httpHeaders);

        return restTemplate.exchange(BASE_URL + "/oauth/2.0/token",
              HttpMethod.POST, param, BankTokenResponseDto.class).getBody();
    }

    // 계좌 조회
    public BankAcountSearchResponseDto requestAccountList(
          BankAccountSearchRequestDto bankAccountSearchRequestDto){
        String url = BASE_URL+"/account/list";
        HttpEntity<String> openBankAccountSearchRequest = new HttpEntity<>(setHeader(
              bankAccountSearchRequestDto.getAccess_token()));
        UriComponents builder = UriComponentsBuilder.fromHttpUrl(url)
              .queryParam("user_seq_no", bankAccountSearchRequestDto.getUser_seq_no())
              .queryParam("include_cancel_yn", bankAccountSearchRequestDto.getInclude_cancel_yn())
              .queryParam("sort_order", bankAccountSearchRequestDto.getSort_order())
              .build();

        return restTemplate.exchange(builder.toUriString(), HttpMethod.GET, openBankAccountSearchRequest, BankAcountSearchResponseDto.class).getBody();
    }

    // 계좌 이체
    public AccountTransferResponseDto requestTransfer(String access_token,
          AccountTransferRequestDto accountTransferRequestDto) {

        String url = BASE_URL + "/transfer/deposit/acnt_num";

        accountTransferRequestDto.setTran_dtime(openBankutil.getTransTime());
        ResponseEntity<AccountTransferRequestDto> param = new ResponseEntity<>(
              accountTransferRequestDto, setHeader(access_token), HttpStatus.OK);
        return restTemplate.exchange(url, HttpMethod.POST, param, AccountTransferResponseDto.class)
              .getBody();
    }

    private HttpHeaders setHeader(String access_token) {
        httpHeaders.add("Authorization", "Bearer " + access_token);
        return httpHeaders;
    }
}