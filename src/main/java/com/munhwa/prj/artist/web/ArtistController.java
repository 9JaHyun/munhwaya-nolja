package com.munhwa.prj.artist.web;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Member;
import java.net.URISyntaxException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.Random;

import javax.websocket.Session;

import org.apache.commons.lang.builder.ToStringBuilder;
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
	@RequestMapping("/artistDetail")
	public String artistDetail(@LoginUser SessionUser user, Model model) {
		ArtistVO vo = new ArtistVO();
		vo.setMemberId(user.getId());
		vo = artistDao.artistSelect(vo);
		model.addAttribute("artist", vo);
		return "artist/artistDetail";
	}

	// 아티스트 회원정보
	@RequestMapping("/artistManagement")
	public String artistManagement() {
		return "artistManagement-artist";
	}

//	// 아티스트 정보 신청 폼 호출
//	@RequestMapping("/artistInsertForm")
//	public String artistInsertForm() {
//		return "artistInsert-artist";
//	}
//
//	// 아티스트 정보 신청
//	@RequestMapping("/artistInsert")
//	public String artistInsert(ArtistVO vo, /* RedirectAttributes */ Model rttr) {
//		vo.setMemberId("test1@gmail.com");
//		System.out.println(vo);
//		int artist = artistDao.artistInsert(vo);
//		System.out.println(artist);
//		if (artist != 0) {
//			rttr.addAttribute("message", "아티스트 정보 등록이 완료되었습니다.");
//
//		} else {
//			rttr.addAttribute("message", "입력 실패하셨습니다.");
//		}
//		return "artist/myPageMove";
//	}

	// 회원 -> 아티스트 승급 신청 폼 호출
	@RequestMapping("/artistRequestForm")
	public String artistRequestForm() {
		return "artistRequest-artist";
	}

	// 아티스트 승급 신청
	@RequestMapping("/artistRequest")
	public String artistRequest(@LoginUser SessionUser user, PromotionRequestVO vo, Model model, MultipartFile file) throws IOException {
		if(file != null && file.getSize() != 0) {
			UploadFile uploadFile = fileUtils.storeFile(file); // common.entity패키지 확인하면 있음
			vo.setFileGroupId(uploadFile.getStoredFileName()); // getStoredFileName : 사진 저장 경로
		}
		//ArtistVO vo = new ArtistVO();
		vo.setMemberId(user.getId());
		//vo.setMemberId("mjerrami@about.me"); // 임시
		vo.setIdentify(null);
		vo.setStatus("A03");
		int req = promotionRequestDao.promotionRequestInsert(vo);
		model.addAttribute("message", "아티스트 승급 신청을 요청했습니다.\r\n운영자로부터의 응답시까지 대기바랍니다.");
		System.out.println(vo);

		return "artist/myPageMove";
	}

	// 아티스트 정보 등록 폼 호출
	@RequestMapping("/artistProfileForm")
	public String artistProfileForm() {

		return "artistProfile-artist";
	}

	// 아티스트 프로필 등록, 수정
	@RequestMapping("/artistProfile") 
	public String artistProfile(@LoginUser SessionUser user, ArtistVO vo, /* RedirectAttributes */ Model rttr) {
		vo.setMemberId(user.getId());
		ArtistVO findArtist = artistDao.artistSelect(vo);
		// 검색
		System.out.println("vo : " + vo);

		if (findArtist == null) {
			int pro = artistDao.artistInsert(vo);
				if(pro != 0) {
					rttr.addAttribute("message", "아티스트 정보 등록이 완료되었습니다.");
				}else {
					rttr.addAttribute("message", "입력 실패하셨습니다.");
				}
		} else {
			vo.setId(findArtist.getId());
				int file = artistDao.artistUpdate(vo);
					if(file != 0) {			
						rttr.addAttribute("message", "아티스트 정보 등록이 완료되었습니다.");
					}else {
						rttr.addAttribute("message", "입력 실패하셨습니다.");
					}

		}
					return "artist/myPageMove";
	}
		
	// 아티스트 승급페이지 본인인증
	@RestController
	@RequiredArgsConstructor
	class SmsController {
						
	private final SmsServiceImpl smsServiceImpl;
						
	@PostMapping("/user/sms")
	public ResponseEntity<SmsResponse> test(String phoneNumber) throws NoSuchAlgorithmException, URISyntaxException,
			UnsupportedEncodingException, InvalidKeyException, JsonProcessingException {
					
			ServerRequest request = new ServerRequest();
			request.setRecipientPhoneNumber(phoneNumber);
			String randomNumber = createRandomNumber();
			request.setContent("본인확인 인증번호는 " + randomNumber + " 입니다.");
			SmsResponse data = smsServiceImpl.sendSms(request.getRecipientPhoneNumber(), request.getContent());
			data.setContent(randomNumber);
							
			return ResponseEntity.ok().body(data);
	}
	
//	@PostMapping("/user/mocksms")  // 훼이크 문자용 
//	public ResponseEntity<String> timertest(String phoneNumber) throws NoSuchAlgorithmException, URISyntaxException,
//			UnsupportedEncodingException, InvalidKeyException, JsonProcessingException {
//			String data = "1";
//		
//			return ResponseEntity.ok().body(data);
//	}
						
	private String createRandomNumber() {
			
			Random random = new Random(); // 랜덤 함수 선언
			int createNum = 0; // 1자리 난수
			String ranNum = ""; // 1자리 난수 형변환 변수
			int letter = 4; // 난수 자릿수:6
			String resultNum = ""; // 결과 난수
							
			for (int i = 0; i < letter; i++) {
				createNum = random.nextInt(9); // 0부터 9까지 올 수 있는 1자리 난수 생성
				ranNum = Integer.toString(createNum); // 1자리 난수를 String으로 형변환
				resultNum += ranNum; // 생성된 난수(문자열)을 원하는 수(letter)만큼 더하며 나열
			}
							
			return resultNum;
	}
		
	}
}
//    // 아티스트 정보 수정 폼 호출
//    @RequestMapping("artistUpdateForm")
//    public String artistUpdateForm() {
//    	
//    	return "artistUpdate-artist";
//    }
//    // 아티스트 정보 수정
//    @RequestMapping("/artistUpdate")
//    public String artistUpdate(ArtistVO vo, Model model) {
//    	System.out.println(vo);
//    	int update = artistDao.artistUpdate(vo);
//    	return "artist/myPageMove";
//    	
//    }

