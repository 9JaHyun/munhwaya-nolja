package com.munhwa.prj.withdraw.api;

import org.springframework.beans.factory.annotation.Value;
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

import com.munhwa.prj.withdraw.dto.AccountSearchRequestDto;
import com.munhwa.prj.withdraw.dto.AccountTransferRequestDto;
import com.munhwa.prj.withdraw.dto.AccountTransferResponseDto;
import com.munhwa.prj.withdraw.dto.BankAcountSearchResponseDto;
import com.munhwa.prj.withdraw.dto.BankBalanceRequestDto;
import com.munhwa.prj.withdraw.dto.BankBalanceResponseDto;
import com.munhwa.prj.withdraw.dto.BankReponseToken;
import com.munhwa.prj.withdraw.dto.BankRequestToken;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@RequiredArgsConstructor
@Service
public class OpenBankApiClient {
    private final OpenBankutil openBankutil;
    private final HttpHeaders httpHeaders;
    private final RestTemplate restTemplate;
    //@Value("${openbank.useCode}")
    private String useCode="M202200536"; // 핀테크번호+U -> 거래고유번호 생성기
    //@Value("${openbank.client-id}")
    private String clientId="12ce99f4-e774-4231-ab01-e287c5d279fc";
    //@Value("${openbank.client-secret}")
    private String client_secret="b45a8f6b-a958-4b21-8f7d-03f85c3e0214";

    private String redirect_uri = "http://localhost:8080/auth/openbank/callback";
    private String base_url = "https://testapi.openbanking.or.kr/v2.0";

    /**
     * 토큰발급요청
     */
    public BankReponseToken requestToken(BankRequestToken bankRequestToken){
        //post 방식으로 key=vale 데이터 요청 (금결원)
        //http 헤더 오브젝트 생성
        httpHeaders.add("Content-Type","application/x-www-form-urlencoded;charset=UTF-8");
        //httpBody 오브젝트 생성
        bankRequestToken.setBankRequestToken(clientId,client_secret,redirect_uri,"authorization_code");
        //헤더의 컨텐트 타입이 application/x-www-form-urlencoded;charset=UTF-8이므로 객체를 집어넣을수 없음.. 그러므로 MultiValueMap 사용 해야함
        MultiValueMap<String, String> parameters = new LinkedMultiValueMap<>();
        parameters.add("code",bankRequestToken.getCode());
        parameters.add("client_id",bankRequestToken.getClient_id());
        parameters.add("client_secret",bankRequestToken.getClient_secret());
        parameters.add("redirect_uri",bankRequestToken.getRedirect_uri());
        parameters.add("grant_type",bankRequestToken.getGrant_type());
        // HttpHeader 와 HttpBody를 하나의 오브젝트에 담기
        HttpEntity<MultiValueMap<String,String>> param =
                new HttpEntity<>(parameters,httpHeaders);
        //Http 요청하기 - post 방식으로
        return restTemplate.exchange("https://testapi.openbanking.or.kr/oauth/2.0/token", HttpMethod.POST, param, BankReponseToken.class).getBody();
    }
    //        //Gson, Json Simple, Object Mapper
//        ObjectMapper objectMapper = new ObjectMapper();
//        BankReponseToken bankReponseToken = null;
//        try {
//            bankReponseToken = objectMapper.readValue(responseEntity.getBody(), BankReponseToken.class);
//
//        } catch (JsonProcessingException e) {
//            e.printStackTrace();
//        }

    /**
     * 계좌조히
     * @param accountSearchRequestDto
     * @return
     */
    public BankAcountSearchResponseDto requestAccountList(AccountSearchRequestDto accountSearchRequestDto){
        String url = base_url+"/account/list";
        HttpEntity<String> openBankAcountSerchRequest = new HttpEntity<>(setHeader(accountSearchRequestDto.getAccess_token()));
        UriComponents builder = UriComponentsBuilder.fromHttpUrl(url)
                .queryParam("user_seq_no", accountSearchRequestDto.getUser_seq_no())
                .queryParam("include_cancel_yn", accountSearchRequestDto.getInclude_cancel_yn())
                .queryParam("sort_order", accountSearchRequestDto.getSort_order())
                .build();

        return restTemplate.exchange(builder.toUriString(), HttpMethod.GET, openBankAcountSerchRequest, BankAcountSearchResponseDto.class).getBody();
    }
    /**
     * 잔액조회
     */
    public BankBalanceResponseDto requestBalance(BankBalanceRequestDto bankBalanceRequestDto, String access_token){
        String url = base_url+"/account/balance/fin_num";
        HttpEntity<String> balance = new HttpEntity<>(setHeader(access_token));
        bankBalanceRequestDto.setBankTransIdAndTranssDtime(openBankutil.getRandomNumber(bankBalanceRequestDto.getBank_tran_id()),openBankutil.getTransTime());
        UriComponents builder = UriComponentsBuilder.fromHttpUrl(url)
                .queryParam("bank_tran_id",bankBalanceRequestDto.getBank_tran_id())
                .queryParam("fintech_use_num", bankBalanceRequestDto.getFintech_use_num())
                .queryParam("tran_dtime",bankBalanceRequestDto.getTran_dtime())
                .build();

        return restTemplate.exchange(builder.toUriString(), HttpMethod.GET, balance, BankBalanceResponseDto.class).getBody();
    }

    /**
     *
     * 계좌이체
     */
    public AccountTransferResponseDto requestTransfer(String access_token, AccountTransferRequestDto accountTransferRequestDto){
        String url = base_url+"//transfer/withdraw/fin_num";
        accountTransferRequestDto.setTran_dtime(openBankutil.getTransTime());
        ResponseEntity<AccountTransferRequestDto> param = new ResponseEntity<>(accountTransferRequestDto,setHeader(access_token),HttpStatus.OK);
        return restTemplate.exchange(url, HttpMethod.POST, param, AccountTransferResponseDto.class).getBody();
    }


    /**
     * 헤더에 엑세스 토큰넣기
     * @param access_token
     * @return
     */
    public HttpHeaders setHeader(String access_token){
        httpHeaders.add("Authorization", "Bearer "+access_token);
        return httpHeaders;
    }

}
