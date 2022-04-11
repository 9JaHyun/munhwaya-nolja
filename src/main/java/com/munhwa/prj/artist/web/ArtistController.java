package com.munhwa.prj.artist.web;


import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URISyntaxException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.munhwa.prj.artist.service.ArtistService;
import com.munhwa.prj.artist.service.PromotionRequestService;
import com.munhwa.prj.artist.serviceImpl.SmsServiceImpl;
import com.munhwa.prj.artist.vo.ArtistVO;
import com.munhwa.prj.artist.vo.PromotionRequestVO;
import com.munhwa.prj.common.entity.UploadFile;
import com.munhwa.prj.common.service.FileUtils;
import com.munhwa.prj.config.auth.LoginUser;
import com.munhwa.prj.config.auth.dto.SessionUser;

import lombok.RequiredArgsConstructor;

/*
 * 작성자:차주연
 * 작성일자:2022/04/05
 * 내용: 아티스트 컨트롤러
 */
@Controller
public class ArtistController {

@Autowired
private ArtistService artistDao;
@Autowired
private FileUtils fileUtils;


@Autowired
private PromotionRequestService promotionRequestDao;

	// 아티스트 상세정보
  	@RequestMapping("/artistDetail.do")
    public String artistDetail(Model model) {
    	ArtistVO vo = new ArtistVO();
        vo.setId(1);
    	vo = artistDao.artistSelect(vo);
    	model.addAttribute("artist", vo);
    	System.out.println(vo);
    	return "artist/artistDetail";
    }
    
  	// 아티스트 회원정보
    @RequestMapping("/artistManagement")
    public String artistManagement(){ 
    	return "artistManagement-artist";
    }
    
    // 아티스트 정보 신청 폼 호출
    @RequestMapping("/artistInsertForm")
    public String artistInsertForm(){
    	return "artistInsert-artist"; 
    }
    
    // 아티스트 정보 신청
    @RequestMapping("/artistInsert")
    public String artistInsert(ArtistVO vo, /*RedirectAttributes*/ Model rttr){
    	vo.setMemberId("test1@gmail.com");
    	System.out.println(vo);
    	int artist = artistDao.artistInsert(vo);
    	System.out.println(artist);
    	if(artist != 0) {
    		rttr.addAttribute("message", "아티스트 정보 등록이 완료되었습니다.");
    		
    	}else {
    		rttr.addAttribute("message", "입력 실패하셨습니다.");
    	}
    	return "artist/myPageMove";
    }
    

    
    // 회원 -> 아티스트 승급 신청 폼 호출
    @RequestMapping("/artistRequestForm")
    public String artistRequestForm() {
    	return "artistRequest-artist";
    }
    
    // 아티스트 승급 신청
    @RequestMapping("/artistRequest")
    public String artistRequest(PromotionRequestVO vo, Model model, MultipartFile file) throws IOException{
    	UploadFile uploadFile = fileUtils.storeFile(file);
    	
    	System.out.println(vo);
    	System.out.println(file);
    	vo.setMemberId("mjerrami@about.me"); // 임시
    	vo.setIdentify(null);
    	vo.setFileGroupId(uploadFile.getStoredFileName()); // getStoredFileName : 사진 저장 경로
    	vo.setStatus("A03");
    	int req = promotionRequestDao.promotionRequestInsert(vo);
    	model.addAttribute("message", "아티스트 승급 신청을 요청했습니다.\r\n수락 시까지 대기바랍니다.");
    	System.out.println(vo);
    	
    	return "artist/myPageMove";
    }
    
    // 아티스트 승급페이지 본인인증
    @RestController
    @RequiredArgsConstructor
    class SmsController {

        private final SmsServiceImpl smsServiceImpl;

        @PostMapping("/user/sms")
        public ResponseEntity<SmsResponse> test(String phoneNumber) throws NoSuchAlgorithmException, URISyntaxException, UnsupportedEncodingException, InvalidKeyException, JsonProcessingException {
        	ServerRequest request = new ServerRequest();
        	request.setRecipientPhoneNumber(phoneNumber);
        	String randomNumber = createRandomNumber();
        	request.setContent("인증번호는 " + randomNumber +" 입니다.");
            SmsResponse data = smsServiceImpl.sendSms(request.getRecipientPhoneNumber(), request.getContent());
            data.setContent(randomNumber);
            
            return ResponseEntity.ok().body(data);
        }
        
        private String createRandomNumber() {
                Random random = new Random();		//랜덤 함수 선언
        		int createNum = 0;  			//1자리 난수
        		String ranNum = ""; 			//1자리 난수 형변환 변수
                int letter    = 4;			//난수 자릿수:6
        		String resultNum = "";  		//결과 난수
        		
        		for (int i=0; i<letter; i++) { 
        			createNum = random.nextInt(9);		//0부터 9까지 올 수 있는 1자리 난수 생성
        			ranNum =  Integer.toString(createNum);  //1자리 난수를 String으로 형변환
        			resultNum += ranNum;			//생성된 난수(문자열)을 원하는 수(letter)만큼 더하며 나열
        		}
        		return resultNum;
        }
    }
}
    
// 
//    @Bean(name="sms")
//    public PropertiesFactoryBean propertiesFactoryBean() throws Exception{
//    	PropertiesFactoryBean propertiesFactoryBean = new PropertiesFactoryBean();
//    	ClassPathResource classPathResource = new ClassPathResource("classpath:config/sms.properties");
//    	
//    	propertiesFactoryBean.setLocation(classPathResource);
//    	
//    	return propertiesFactoryBean;
//    			
//    }