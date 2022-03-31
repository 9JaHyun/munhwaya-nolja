package com.munhwa.prj.artist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.munhwa.prj.artist.service.ArtistService;
import com.munhwa.prj.artist.vo.ArtistVO;

@Controller
public class ArtistController {

@Autowired
private ArtistService artistDao;

	
  	@RequestMapping("/artistDetail.do")
    public String artistDetail(Model model) {
    	ArtistVO vo = new ArtistVO();
        vo.setId(1);
    	vo = artistDao.artistSelect(vo);
    	model.addAttribute("artist", vo);
    	System.out.println(vo);
    	return "artist/artistDetail";
    }
    
    @RequestMapping("/artistManagement")
    public String artistManagement(){ 
    	return "artistManagement-artist";
    }

    @RequestMapping("/artistRequestForm")
    public String artistRequestForm(){
    	return "artistRequest-artist"; // member�� side bar�� ������ ����
    }
    
    @PostMapping("/info")
    public String artistRequest(ArtistVO vo, Model model){
    	int a = artistDao.artistInsert(vo);
    	if(a != 0) {
    		model.addAttribute("message", "아티스트 신청이 완료되었습니다.");
    	}else {
    		model.addAttribute("message", "입력 실패했습니다.");
    	}
    	return "mypage-artist";
}
}