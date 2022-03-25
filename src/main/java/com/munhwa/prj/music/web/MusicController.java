package com.munhwa.prj.music.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.munhwa.prj.music.service.MusicService;


@Controller
public class MusicController {
	@Autowired
	private MusicService musicDAO;
	
	 @GetMapping("/musicMain")
	    public String music() {
	        return "music/musicMain2";
	    }
	
	@RequestMapping("musicList.do")
	public String memberList(Model model) {
		model.addAttribute("music", musicDAO.musicSelectList());
		return "music/memberList";
	}
}
