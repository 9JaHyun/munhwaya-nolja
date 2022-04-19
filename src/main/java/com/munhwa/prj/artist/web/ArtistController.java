package com.munhwa.prj.artist.web;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.munhwa.prj.admin.web.ArtistChangeRequestDto;
import com.munhwa.prj.artist.service.ArtistService;
import com.munhwa.prj.artist.service.PromotionRequestService;
import com.munhwa.prj.artist.serviceImpl.SmsServiceImpl;
import com.munhwa.prj.artist.vo.ArtDetailVO;
import com.munhwa.prj.artist.vo.ArtDetailVO2;
import com.munhwa.prj.artist.vo.ArtistVO;
import com.munhwa.prj.artist.vo.PromotionRequestVO;
import com.munhwa.prj.common.file.entity.UploadFile;
import com.munhwa.prj.common.file.service.FileUtils;
import com.munhwa.prj.common.paging.entity.Criteria;
import com.munhwa.prj.common.paging.entity.PageDTO;
import com.munhwa.prj.config.auth.LoginUser;
import com.munhwa.prj.config.auth.dto.SessionUser;
import com.munhwa.prj.music.service.MusicService;
import com.munhwa.prj.music.vo.AlbumVO;
import com.munhwa.prj.music.vo.MusicVO;
import com.munhwa.prj.wishlist.service.WishlistService;
import com.munhwa.prj.wishlist.vo.WishlistVO;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URISyntaxException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

/*
 * 작성자:차주연
 * 작성일자:2022/04/05
 * 내용: 아티스트 컨트롤러
 */
@Controller
public class ArtistController {
	
	private final ArtistService artistDao;
	private final WishlistService wishlistDao;
	private final FileUtils fileUtils;
	private final PromotionRequestService promotionRequestDao;
	
	
	public ArtistController(ArtistService artistDao, FileUtils fileUtils,
		PromotionRequestService promotionRequestDao, WishlistService wishlistDao) {
		this.wishlistDao = wishlistDao;
		this.artistDao = artistDao;
		this.fileUtils = fileUtils;
		this.promotionRequestDao = promotionRequestDao;
	}

	// 아티스트 상세정보
	
	@RequestMapping("/artistDetail")
	public String artistDetail(@LoginUser SessionUser user,  Model model, Criteria cri) {
		ArtistVO artist = artistDao.findByMemberId(user.getId());
		model.addAttribute("artist", artist);
		
		List<ArtDetailVO> list = artistDao.findMusic(cri,artist.getId());
		model.addAttribute("musicList", list);
		
		int total = artistDao.getTotal(cri, artist.getId());
		PageDTO pageMaker = new PageDTO(cri, total);
		model.addAttribute("pageMaker", pageMaker);
		
		//사용자의 위시리스트를 리스트로 불러와서 모델에 담는다
		List<WishlistVO> list1 = wishlistDao.wishlistList(user.getId());
		model.addAttribute("wishList", list1);
		
		// 곡 개수
		int musicCnt = artistDao.musicCnt(artist.getId());
		model.addAttribute("musicCnt", musicCnt);
		
		// 앨범 개수
		int albumCnt = artistDao.albumCnt(artist.getId());
		model.addAttribute("albumCnt", albumCnt);
		
		
		
		
		return "artist/artistDetail";
	}
	
	@ResponseBody
	@RequestMapping("checkBuy") //구매할려는 곡이 이미 샀는곡인지 아니면 안산곡인지 체크
	public int checkBuy (@LoginUser SessionUser user, @RequestParam int id ) {
		int r = artistDao.checkBuy(user.getId(), id);
		return r;
		
	}
	
//	// 곡 목록 페이징 처리
//	@GetMapping("/page")
//	public String musicListPage(Model model, Criteria cri) {
//		
//		List<ArtDetailVO2> list = artistDao.musicListPage(cri);
//		
//		model.addAttribute("page", list);
//		
//		int total = artistDao.getTotal(cri, )
//	    PageDTO pageMake = new PageDTO(cri, total);
//	    model.addAttribute("pageMaker", pageMake);
//		
//	    return "artist/artistDetail";
//	}
		//log.info("musicListPage");
		        
		//model.addAttribute("page", artistDao.musicListPage(cri));
		        
		/*
		 * int total = ArtistService.getTotal();
		 * 
		 * PageDTO pageMake = new PageDTO(cri, total);
		 * 
		 * model.addAttribute("pageMaker", pageMake);
		 */
		        
		 //   }    
	
	
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

	

	// 아티스트 프로필 등록 폼 호출
	@RequestMapping("/artistProfileForm")
	public String artistProfileForm() {

		return "artistProfile-artist";
	}

	// 아티스트 프로필 등록
	@RequestMapping("/artistProfile") 
	public String artistProfile(@LoginUser SessionUser user, ArtistVO vo, Model model) {
		vo.setMemberId(user.getId());

		int pro = artistDao.save(vo);
			if(pro != 0) {
				model.addAttribute("message", "아티스트 정보 등록이 완료되었습니다.");
			}else {
					model.addAttribute("message", "입력 실패하셨습니다.");
			}
			
			return "artist/myPageMove";
	}
	
    // 아티스트 정보 수정 폼 호출
    @RequestMapping("/changeArtistProfileForm")
    public String changeArtistProfileForm(@LoginUser SessionUser user, Model model) {
		ArtistVO artist = artistDao.findByMemberId(user.getId());

		model.addAttribute("artist", artist);
    	return "changeArtistProfile-artist";
    }
    
    @PostMapping("/changeArtistProfile")
    public String changeArtistProfile(@LoginUser SessionUser user, ArtistChangeRequestDto dto) throws IOException {
    	ArtistVO artist = dto.toEntity();
    	UploadFile file = fileUtils.storeFile(dto.getImage());
    	artist.setMemberId(user.getId());
    	artist.setImage(file.getStoredFileName());
    
    	artistDao.update(artist);
    	return "redirect:mypage.do";
    }
    
//    // 활동명 중복체크
//    @ResponseBody
//    @PostMapping("/nameChk")
//    public int nameChk(String name) {
//    	
//        return artistDao.nameChk(name);
//    }

//    // 아티스트 정보 수정
//    @RequestMapping("changeArtistProfile")
//    public String changeArtistProfile(@LoginUser SessionUser user, ArtistVO vo, /* RedirectAttributes */ Model rttr) {
//    	vo.setMemberId(user.getId());
//    	//String memeberId = user.getNickname();
//    	vo = artistDao.artistSelect(vo);
//    	
//    	rttr.addAttribute(vo);
//    	vo.setMemberId(user.getId());
//    		vo.getName();
//    		vo.getImage();
//    		vo.getGender();
//    		vo.getType();
//    		vo.getGenre();
//    		vo.getContent();
//    		ArtistVO findArtist = artistDao.artistSelect(vo);
//    		// 검색
//    		System.out.println("vo : " + vo);
//    		
//    		rttr.add
//    				int file = artistDao.artistUpdate(findArtist);
//    					if(file != 0) {			
//    						rttr.addAttribute("message", "아티스트 정보 수정이 완료되었습니다.");
//    					}else {
//    						rttr.addAttribute("message", "입력 실패하셨습니다.");
//    					}

    	
//    	return "mypage.do-artist";
//    }
    
//    		if (findArtist == null) {
//    			int pro = artistDao.artistInsert(vo);
//    				if(pro != 0) {
//    					rttr.addAttribute("message", "아티스트 정보 등록이 완료되었습니다.");
//    				}else {
//    					rttr.addAttribute("message", "입력 실패하셨습니다.");
//    				}
//    		} else {
//    			vo.setId(findArtist.getId());
		
    
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

//    // 아티스트 정보 수정
//    @RequestMapping("/artistUpdate")
//    public String artistUpdate(ArtistVO vo, Model model) {
//    	System.out.println(vo);
//    	int update = artistDao.artistUpdate(vo);
//    	return "artist/myPageMove";
//    	
//    }

