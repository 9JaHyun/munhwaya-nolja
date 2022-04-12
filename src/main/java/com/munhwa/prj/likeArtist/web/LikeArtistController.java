package com.munhwa.prj.likeArtist.web;

import com.munhwa.prj.config.auth.LoginUser;
import com.munhwa.prj.config.auth.dto.SessionUser;
import com.munhwa.prj.likeArtist.service.LikeArtistService;
import com.munhwa.prj.likeArtist.vo.LikeArtistVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class LikeArtistController {

	@Autowired
	private LikeArtistService likeArtistDao;
    
    // 좋아요 한 아티스트 리스트
	@GetMapping("/likeArtist.do")
	public String likeArtistList(@LoginUser SessionUser user, Model model) {
		model.addAttribute("likeArtists", likeArtistDao.likeArtistList(user.getId()));
		return "likeArtist-member";
	}
	
	// 좋아요 한 아티스트 삭제
	@ResponseBody
    @RequestMapping("/deleteLikeArtist.do")
    public String deleteLikeArtist(@LoginUser SessionUser user, @RequestBody ArtistDeleteReqeustDto dto) {
    	LikeArtistVO vo = new LikeArtistVO();
    	vo.setMemberId(user.getId());
    	vo.setArtistId(dto.getArtistId());
    	
    	likeArtistDao.deleteLikeArtist(vo);
    	return "redirect:likeArtist.do";
    }
}
