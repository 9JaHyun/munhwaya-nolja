package com.munhwa.prj.withdraw.web;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.munhwa.prj.withdraw.dto.CodeResponseDTO;
import com.munhwa.prj.withdraw.dto.TokenRequestDTO;
import com.munhwa.prj.withdraw.dto.TokenResponseDTO;
import com.munhwa.prj.withdraw.dto.User;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class WithdrawController {

	private final RestTemplate restTemplate;
    private final HttpHeaders httpHeaders;
    private final String REDIRECT_URI = "http://localhost/prj/auth/openbank/code";
    private final String BASE_URL = "https://testapi.openbanking.or.kr";

    public WithdrawController() {
        this.restTemplate = new RestTemplate();
        this.httpHeaders = new HttpHeaders();
    }

    @GetMapping("/withdraw")
    public String testIndex() {
        return "withdraw/withdraw";
    }

    @ResponseBody
    @GetMapping("/auth/openbank/code")
    public void receive(@ModelAttribute CodeResponseDTO responseDTO) {
        log.info("getCode! ={}", responseDTO.toString());
        getToken(responseDTO.getCode());
    }

    public TokenResponseDTO getToken(String code) {
        User user = new User();
        TokenRequestDTO dto = new TokenRequestDTO(code, user.getClientId(), user.getClientSecret(),
              REDIRECT_URI, "authorization_code");

        httpHeaders.add("Content-Type","application/x-www-form-urlencoded;charset=UTF-8");

        MultiValueMap<String, String> parameters = new LinkedMultiValueMap<>();
        parameters.add("code", dto.getCode());
        parameters.add("client_id", dto.getClientId());
        parameters.add("client_secret", dto.getClientSecret());
        parameters.add("redirect_uri", dto.getRedirectUri());
        parameters.add("grant_type", dto.getGrantType());

        HttpEntity<MultiValueMap<String, String>> param = new HttpEntity<>(parameters, httpHeaders);

        //Http 요청하기 - post 방식으로
        TokenResponseDTO result = restTemplate.exchange(
                BASE_URL + "/oauth/2.0/token",
                HttpMethod.POST, param, TokenResponseDTO.class).getBody();
        System.out.println("----------"+result.getAccess_token());

        return result;
    }
}
