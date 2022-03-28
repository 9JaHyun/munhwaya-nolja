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
	    public String musicMain() {
	        return "music/musicMain";
	}
	
	@GetMapping("/searchResult")
    public String searchResult() {
        return "music/searchResult";
    }
	
	@GetMapping("/searchResultMusic")
    public String searchResultMusic() {
        return "music/searchResultMusic";
    }
	
	@GetMapping("/searchResultAlbum")
    public String searchResultAlbum() {
        return "music/searchResultAlbum";
    }
	
	@GetMapping("/chart")
    public String chart() {
        return "music/chart";
    }
	
	@GetMapping("/releaseSoon")
	public String releaseSoon() {
		return "music/releaseSoon";
	}
	
	@GetMapping("/albumInfo")
	public String albumInfo() {
		return "music/albumInfo";
	}
	
	@GetMapping("/streaming")
	public String streaming() {
		return "music/streaming";
	}
	
	@GetMapping("/personalResult")
	public String personalResult() {
		return "music/personalResult";
	}
	
	@GetMapping("/genre")
	public String genre() {
		return "music/genre";
	}
	
	@GetMapping("/purchase")
	public String purchase() {
		return "music/purchase";
	}
	
	@RequestMapping("musicList.do")
	public String memberList(Model model) {
		model.addAttribute("music", musicDAO.musicSelectList());
		return "music/memberList";
	}
}
