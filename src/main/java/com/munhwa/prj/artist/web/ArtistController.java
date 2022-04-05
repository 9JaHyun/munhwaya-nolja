package com.munhwa.prj.artist.web;


import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.munhwa.prj.artist.service.ArtistService;
import com.munhwa.prj.artist.service.PromotionRequestService;
import com.munhwa.prj.artist.vo.ArtistVO;
import com.munhwa.prj.artist.vo.PromotionRequestVO;
import com.munhwa.prj.common.entity.UploadFile;
import com.munhwa.prj.common.service.FileUtils;

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
    
 
    
}