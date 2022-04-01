package com.munhwa.prj.artist.web;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.munhwa.prj.artist.service.ArtistService;
import com.munhwa.prj.artist.vo.ArtistVO;

/*
 * 작성자:
 * 작성일자:
 * 내용: 아티스트
 */
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

    @RequestMapping("/artistInsertForm")
    public String artistInsertForm(){
    	return "artistInsert-artist"; 
    }
    
    @RequestMapping("/artistInsert")
    public String artistInsert(ArtistVO vo, Model model){
    	int a = artistDao.artistInsert(vo);
    	System.out.println(a);
    	if(a != 0) {
    		model.addAttribute("message", "아티스트 정보 등록이 완료되었습니다.");
    		
    	}else {
    		model.addAttribute("message", "입력에 실패했습니다.");
    	}
    	return "redirect:mypage.do-artist";
    }
    
    @RequestMapping("/artistRequestForm")
    public String artistRequestForm() {
    	return "artistRequest-artist";
    }
    
    
}