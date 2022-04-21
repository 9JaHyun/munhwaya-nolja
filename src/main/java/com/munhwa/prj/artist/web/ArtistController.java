package com.munhwa.prj.artist.web;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URISyntaxException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.List;
import java.util.Random;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

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
import com.munhwa.prj.member.service.MemberService;
import com.munhwa.prj.member.vo.MemberVO;
import com.munhwa.prj.wishlist.service.WishlistService;
import com.munhwa.prj.wishlist.vo.WishlistVO;

import lombok.RequiredArgsConstructor;

/*
 * 작성자:차주연
 * 작성일자:2022/04/05
 * 내용: 아티스트 컨트롤러
 */
@RequiredArgsConstructor
@Controller
public class ArtistController {
	
	private final ArtistService artistDao;
	private final WishlistService wishlistDao;
	private final FileUtils fileUtils;
	private final PromotionRequestService promotionRequestDao;
	private final MemberService memberService;

	// 아티스트 상세정보
	
	@RequestMapping("/artistDetail")
	public String artistDetail(@LoginUser SessionUser user, Model model, int artId
			, Integer musicPageNum
			, Integer musicAmount
			, Integer albumPageNum
			, Integer albumAmount) {
	
		//정우 => 아티스트아이디를 넘겨주면서 이 페이지를 호출
		//user.getId() -> memberId를 가져와서 그 
		//아티스트 아이디로 찾아올것
		
		// 해당 아티스트 정보 찾아서 상세정보 페이지로 보내기
		ArtistVO artist = artistDao.findByArtistId(artId); // 데이터가 안맞으므로 고쳐야할수도..  -> 변동사항 : artist.getId();, 해당하는 user가 아니라 해당 아티스트에 대한 인물정보이므로
		model.addAttribute("artist", artist);
		
		
		if(musicPageNum == null) {
			musicPageNum=1;
			musicAmount=10;
		}
		
		if(albumPageNum == null) {
			albumPageNum=1;
			albumAmount=3;
		}
		Criteria musicCri = new Criteria(musicPageNum, musicAmount);
		
		// 곡 목록의 데이터를 담아서 페이징 처리
		List<ArtDetailVO> list = artistDao.findMusic(musicCri, artist.getId());

		model.addAttribute("musicList", list);	
		// 곡 전체 개수 구하기
		int total = artistDao.getTotal(musicCri, artist.getId()); // Creiteria 클래스 정보(PageNum:현재페이지, amount: 수량), 해당 아티스트 아이디(aritstId로 곡 갯수 세아림)
		PageDTO pageMaker = new PageDTO(musicCri, total); // PageDTO의 (현재 페이지: 페이지당 게시물 표시수) , total(현재페이지, 수량)
		model.addAttribute("pageMaker", pageMaker);
		
		
		Criteria albumCri = new Criteria(albumPageNum, albumAmount); //어마운트는 보여질 게시물 수
		// 앨범 목록의 데이터를 담아서 페이징 처리
		List<ArtDetailVO2> album = artistDao.albumInfo(albumCri,artist.getId());
		
		
		albumCri.setAmount(3); // 앨범 게시물 수 3개 호출
		model.addAttribute("album", album);
		
		// 앨범 전체 개수 구하기
		int total2 = artistDao.getTotal2(albumCri, artist.getId());
		PageDTO pagemaker2 = new PageDTO(albumCri, total2);
		model.addAttribute("pageMaker2", pagemaker2);
		
//========================================================================================
		
		//사용자의 위시리스트를 리스트로 불러와서 모델에 담는다
		List<WishlistVO> list1 = wishlistDao.wishlistList(user.getId());
		model.addAttribute("wishLists", list1);
		
		// 곡 개수
		int musicCnt = artistDao.musicCnt(artist.getId());
		model.addAttribute("musicCnt", musicCnt);
		
		// 앨범 개수
		int albumCnt = artistDao.albumCnt(artist.getId());
		model.addAttribute("albumCnt", albumCnt);
		
		
		return "artist/artistDetail";
	}
	
	// 이미 구매한 곡인지, 구매안한 곡인지 체크
	@ResponseBody
	@RequestMapping("checkBuy") 
	public int checkBuy (@LoginUser SessionUser user, @RequestParam int id ) {
		int r = artistDao.checkBuy(user.getId(), id);
		return r;
		
	}

	// 아티스트 회원정보
	@RequestMapping("/artistManagement")
	public String artistManagement() {
		return "artistManagement-artist";
	}

	// 아티스트 프로필 등록 폼 호출
	@RequestMapping("/artistProfileForm")
	public String artistProfileForm() {

		return "artistProfile-artist";
	}

	// 아티스트 프로필 등록
	@RequestMapping("/artistProfile") 
	public String artistProfile(@LoginUser SessionUser user, ArtistVO vo, Model model) {
		vo.setMemberId(user.getId());

		int pro = artistDao.insertArtist(vo);
			if(pro != 0) {
		    	MemberVO member = new MemberVO();
		    	member.setId(vo.getMemberId());
		    	member.setNickname(vo.getName());
		    	member.setSname(vo.getImage());
		    	memberService.updateProfile(member);
		    	user.setSname(vo.getImage());
		    	user.setNickname(vo.getName());
		    	
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
    
 	@ResponseBody
    @PostMapping("/changeArtistProfile")
    public String changeArtistProfile(@LoginUser SessionUser user, ArtistChangeRequestDto dto) throws IOException { //AtistChangeRequestDto : AtistChangeRequestDto를 호출해서 
    	ArtistVO artist = dto.toEntity(); // ArtistVO의 내용을 호출하여 AtistChangeRequestDto안의 ArtistVO메소드를 return한다.(=기존 정보 호출하고 값은 dto에 저장된 수정 정보 return하기)
    	UploadFile file = fileUtils.storeFile(dto.getImage()); // dto의 이미지 호출 
		MemberVO member = new MemberVO();
    	if(file != null) {//파일을 선택안하고, 변경을 안하고 수정버튼을 눌렀다면 file => null(파일이 없다.)
    		artist.setImage(file.getStoredFileName());	//파일수정안하면 오류 // getStoredFileName하는 이유 : 기존 파일이 없을 경우 오류가 나므로 임으로 파일 이름담아서 artist변수에 담음
    		user.setSname(artist.getImage());
    	}
    	artist.setMemberId(user.getId());
    	int result = artistDao.updateArtist(artist);
    	if(result != 0) {

    		member.setId(artist.getMemberId());
    		member.setNickname(artist.getName());
    		member.setSname(artist.getImage());
    		memberService.updateProfile(member);
    		user.setNickname(artist.getName());
    	}
    	return "mypage.do";
    }
    
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
	
	@RequestMapping("/artStatus")
	public String artStatus(@LoginUser SessionUser user, PromotionRequestVO vo, Model model) {
		
		//vo.setMemberId(user.getId());
		PromotionRequestVO status = artistDao.getStatus(user.getId(), status); // user 세션에 있는 승인 상태를 artStatus에 뿌리기.
		return "artStatus-artist";
		
		
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

