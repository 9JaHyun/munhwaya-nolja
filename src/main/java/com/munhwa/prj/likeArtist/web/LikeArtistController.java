package com.munhwa.prj.likeArtist.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.munhwa.prj.likeArtist.service.LikeArtistService;
import com.munhwa.prj.likeArtist.vo.LikeArtistVO;

@Controller
public class LikeArtistController {
	
	@Autowired
	private LikeArtistService likeArtitstDao;
    
    // 좋아요 한 아티스트 리스트
	@GetMapping("/likeArtist.do")
	public String likeArtistList(HttpServletRequest request, Model model) {
//		String memberId = request.getSession().getAttribute("member");
		model.addAttribute("likeArtists", likeArtitstDao.likeArtistList("test1@gmail.com"));
		return "likeArtist-member";
	}
	
	// 좋아요 한 아티스트 삭제
	@ResponseBody
    @RequestMapping("/deleteLikeArtist.do")
    public String deleteLikeArtist(@RequestBody ArtistDeleteReqeustDto dto) {
    	LikeArtistVO vo = new LikeArtistVO();
    	vo.setMemberId("test1@gmail.com");
    	vo.setArtistId(dto.getArtistId());
    	
    	likeArtitstDao.deleteLikeArtist(vo);
    	return "redirect:likeArtist.do";
    	
    } 

}
