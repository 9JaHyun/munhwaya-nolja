package com.munhwa.prj.artist.web;


import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URISyntaxException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.PropertiesFactoryBean;
import org.springframework.context.annotation.Bean;
import org.springframework.core.io.ClassPathResource;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
    
    // 아티스트 정보 수정 폼 호출
    @RequestMapping("/artistInsertForm")
    public String artistInsertForm(){
    	return "artistInsert-artist"; 
    }
    
    // 아티스트 정보 수정
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
    public class SmsController {

        private final SmsServiceImpl smsServiceImpl;

        @PostMapping("/user/sms")
        public ResponseEntity<SmsResponse> test(@RequestBody ServerRequest request) throws NoSuchAlgorithmException, URISyntaxException, UnsupportedEncodingException, InvalidKeyException, JsonProcessingException {
            SmsResponse data = smsServiceImpl.sendSms(request.getRecipientPhoneNumber(), request.getContent());
            return ResponseEntity.ok().body(data);
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
    
}