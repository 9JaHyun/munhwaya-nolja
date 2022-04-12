package com.munhwa.prj.artist.serviceImpl;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.munhwa.prj.artist.web.MessagesDTO;
import com.munhwa.prj.artist.web.SmsRequest;
import com.munhwa.prj.artist.web.SmsResponse;
import com.munhwa.prj.common.service.PropertiesScan;
import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URLEncoder;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import org.apache.commons.codec.binary.Base64;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.client.RestTemplate;

@Service
@Transactional
public class SmsServiceImpl {

    private String serviceId;
    private String accessKey;
    private String secretKey;

    public SmsServiceImpl() {
    	PropertiesScan scan = new PropertiesScan();
    	Properties smsInfo = scan.readProperties("config/sms.properties");
        serviceId = smsInfo.getProperty("sms.serviceId");
        accessKey = smsInfo.getProperty("sms.accessKey");
        secretKey = smsInfo.getProperty("sms.secretKey");
	}
    
	public SmsResponse sendSms(String recipientPhoneNumber, String content) throws JsonProcessingException, UnsupportedEncodingException, NoSuchAlgorithmException, InvalidKeyException, URISyntaxException {
        Long time = System.currentTimeMillis();

        // 메세지 생성
        List<MessagesDTO> messages = new ArrayList<>();
        messages.add(new MessagesDTO(recipientPhoneNumber, content)); // DTO에 들어감 필드 to, content

        SmsRequest smsRequest = new SmsRequest("SMS", "COMM", "82", "01021771766", "내용", messages);
        
        // json형태로 변환(WEB에 만든 DTO -> JSON 타입으로 변환 후 JSP로 가게함 / JSON 타입은 object에서 값을 읽어 jsp로 보냄)
        ObjectMapper objectMapper = new ObjectMapper();
        String jsonBody = objectMapper.writeValueAsString(smsRequest);

        // 헤더 설정값 셋팅
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        headers.set("x-ncp-apigw-timestamp", time.toString()); //  API Gateway 서버와 시간 차가 5분 이상 나는 경우 유효하지 않은 요청으로 간주
        headers.set("x-ncp-iam-access-key", this.accessKey); // 네이버 클라우드 플랫폼 포털 또는 Sub Account에서 발급받은 Access Key ID

        // signature 서명
        String sig = makeSignature(time); //암호화
               
        headers.set("x-ncp-apigw-signature-v2", sig); //위 예제의 Body를 Access Key ID와 맵핑되는 Secret Key로 암호화한 서명
        											// HMAC 암호화 알고리즘은 HmacSHA256 사용

        HttpEntity<String> body = new HttpEntity<>(jsonBody,headers);
        System.out.println(body.toString());
        RestTemplate restTemplate = new RestTemplate();
        restTemplate.setRequestFactory(new HttpComponentsClientHttpRequestFactory());
        SmsResponse smsResponse = restTemplate.postForObject(new URI("https://sens.apigw.ntruss.com/sms/v2/services/"+URLEncoder.encode(this.serviceId, "UTF-8")+"/messages"), body, SmsResponse.class);

        return smsResponse;

    }
    public String makeSignature(Long time) throws UnsupportedEncodingException, NoSuchAlgorithmException, InvalidKeyException {

        String space = " ";
        String newLine = "\n";
        String method = "POST";
        String url = "/sms/v2/services/"+ URLEncoder.encode(this.serviceId, "UTF-8")+"/messages";
        String timestamp = time.toString();
        String accessKey = this.accessKey;
        String secretKey = this.secretKey;

    	String message = new StringBuilder()
    		.append(method)
    		.append(space)
    		.append(url)
    		.append(newLine)
    		.append(timestamp)
    		.append(newLine)
    		.append(accessKey)
    		.toString();

    	SecretKeySpec signingKey = new SecretKeySpec(secretKey.getBytes("UTF-8"), "HmacSHA256");
    	Mac mac = Mac.getInstance("HmacSHA256");
    	mac.init(signingKey);

    	byte[] rawHmac = mac.doFinal(message.getBytes("UTF-8"));
    	String encodeBase64String = Base64.encodeBase64String(rawHmac);

      return encodeBase64String;
    }
    
}
