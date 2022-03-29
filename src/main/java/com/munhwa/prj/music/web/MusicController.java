package com.munhwa.prj.music.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

import com.munhwa.prj.music.service.AlbumService;
import com.munhwa.prj.music.service.MusicService;
import com.munhwa.prj.music.vo.AlbumVO;


@Controller
public class MusicController {
	@Autowired
	private MusicService musicDAO;
	@Autowired
	private AlbumService albumDAO;

	/* 페이지 요청 */
	@GetMapping("/musicMain")
		public String musicMain(Model model,HttpServletRequest req) {
		/*
		 * Map<Integer, CartVO> map = (Map<Integer, cart>) session.getAttribute("cart");
		 * map.set(musicVO.getId(), musicVO) session.addAttribue("cart", map)
		 */
		HttpSession session = req.getSession();
		session.setAttribute("id", "test0@gmail.com");
		String id = session.getAttribute("id").toString();
		
		model.addAttribute("musicRnBList", musicDAO.musicSelectListByGenre("G04"));
		model.addAttribute("musicRapList", musicDAO.musicSelectListByGenre("G03"));
		model.addAttribute("musicDanceList", musicDAO.musicSelectListByGenre("G02"));
		model.addAttribute("musicBalladList", musicDAO.musicSelectListByGenre("G01"));
		
		model.addAttribute("musicChartList", musicDAO.musicSelectList());
		model.addAttribute("releaseSoonAlbumList", albumDAO.albumSelectListByRelease());
		model.addAttribute("musicPersonalList", musicDAO.musicPersonalList(id));
		
	    return "music/musicMain";
	}
	
	@GetMapping("/searchResult")
    public String searchResult(String title, Model model) {
		model.addAttribute("musicSelectListByTitle", musicDAO.musicSelectByTitle(title));
		model.addAttribute("albumSelectListByTitle", albumDAO.albumSelectByTitle(title));
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
    public String chart(Model model) {
		model.addAttribute("musicChartList", musicDAO.musicSelectList());
        return "music/chart";
    }
	
	@GetMapping("/releaseSoon")
	public String releaseSoon(Model model) {
		model.addAttribute("releaseSoonAlbumList", albumDAO.albumSelectListByRelease());
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
	public String personalResult(Model model,HttpServletRequest req) {
		HttpSession session = req.getSession();
		session.setAttribute("id", "test0@gmail.com");
		String id = session.getAttribute("id").toString();
		
		model.addAttribute("musicPersonalList", musicDAO.musicPersonalList(id));
		return "music/personalResult";
	}
	
	@GetMapping("/genre")
	public String genre(Model model) {
		model.addAttribute("musicRnBList", musicDAO.musicSelectListByGenre("G04"));
		model.addAttribute("musicRapList", musicDAO.musicSelectListByGenre("G03"));
		model.addAttribute("musicDanceList", musicDAO.musicSelectListByGenre("G02"));
		model.addAttribute("musicBalladList", musicDAO.musicSelectListByGenre("G01"));
		
		return "music/genre";
	}
	
	@GetMapping("/purchase")
	public String purchase() {
		return "music/purchase";
	}
	
	/* 뮤직메인용 */
	@ResponseBody
	@GetMapping("/musicSelectListByGenre/{genre}")
	public void musicList(@PathVariable String genre, Model model) {
		model.addAttribute("musicList", musicDAO.musicSelectListByGenre(genre));
	}
	
	
}
