package com.munhwa.prj.music.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.munhwa.prj.music.service.AlbumService;
import com.munhwa.prj.music.service.MusicService;
import com.munhwa.prj.music.vo.AlbumVO;
import com.munhwa.prj.music.vo.MusicVO;

@Controller
public class MusicController {
	@Autowired
	private MusicService musicDAO;
	@Autowired
	private AlbumService albumDAO;

	public String musicMain(Model model, HttpSession session) {
		/*
		 * Map<Integer, CartVO> map = (Map<Integer, cart>) session.getAttribute("cart");
		 * map.set(musicVO.getId(), musicVO) session.addAttribue("cart", map)
		 */
		session.setAttribute("id", "test0@gmail.com");
		String id = session.getAttribute("id").toString();
		model.addAttribute("musicRnBList", musicDAO.musicSelectListByGenre("G04"));
		model.addAttribute("musicRapList", musicDAO.musicSelectListByGenre("G03"));
		model.addAttribute("musicDanceList", musicDAO.musicSelectListByGenre("G02"));
		model.addAttribute("musicBalladList", musicDAO.musicSelectListByGenre("G01"));

		model.addAttribute("musicChartList", musicDAO.musicSelectList());// 갯수지정
		model.addAttribute("releaseSoonAlbumList", albumDAO.albumSelectListByRelease());// 갯수지정
		model.addAttribute("musicPersonalList", musicDAO.musicPersonalList(id));

		return "music/musicMain";
	}

	@GetMapping("/searchResult")
	public String searchResult(String title, Model model) {
		model.addAttribute("musicSelectListByTitle", musicDAO.musicSelectByTitle(title));
		model.addAttribute("title", title);
		return "music/searchResult";
	}

	@GetMapping("/searchResultMusic")
	public String searchResultMusic(Model model, String title) {
		System.out.println(title);
		System.out.println("타이틀테스트");
		model.addAttribute("musicSelectListByTitle", musicDAO.musicSelectByTitle(title));
		return "music/searchResultMusic";
	}

	@GetMapping("/searchResultAlbum")
	public String searchResultAlbum(Model model, String title) {
		model.addAttribute("musicSelectListByTitle", musicDAO.musicSelectByTitle(title));
		return "music/searchResultAlbum";
	}

	@GetMapping("/chart")
	public String chart(Model model) {
		model.addAttribute("musicChartList", musicDAO.musicSelectList());// 갯수지정
		return "music/chart";
	}

	@GetMapping("/releaseSoon")
	public String releaseSoon(Model model) {
		model.addAttribute("releaseSoonAlbumList", albumDAO.albumSelectListByRelease());
		return "music/releaseSoon";
	}

	@GetMapping("/albumInfo")
	public String albumInfo(Model model, int id) {
		model.addAttribute("selectAlbum", albumDAO.albumSelect(id));
		model.addAttribute("selectMusicByAlbum", musicDAO.musicSelectByAlBum(id));// list
		return "music/albumInfo";
	}

	@GetMapping("/streaming")
	public String streaming(Model model, int id) {
		model.addAttribute("musicSelect", musicDAO.musicSelect(id));
		model.addAttribute("AlbumSelectByMusicId", albumDAO.albumSelectByMusicId(id));
		return "music/streaming";
	}

	@GetMapping("/streamingWishList")
	public String streamingWishList(Model model, int id) {
		model.addAttribute("musicSelectListByWishList", musicDAO.musicSelectListByWishList(id));
		model.addAttribute("albumSelectListByWishList", albumDAO.albumSelectListByWishList(id));
		model.addAttribute("albumSelectByWishList", albumDAO.albumSelectByWishList(id)); // 위시리스트의 첫번째 곡의 앨범정보
		return "music/streamingWishList";
	}

	@GetMapping("/personalResult")
	public String personalResult(Model model, HttpServletRequest req) {
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
	public String purchase(Model model, HttpServletRequest req) {
		HttpSession session = req.getSession();
		session.setAttribute("id", "test0@gmail.com");
		String id = session.getAttribute("id").toString();

		model.addAttribute("purchasedList", musicDAO.musicSelectListByPurchase(id));
		return "music/purchase";
	}
	
	@ResponseBody
	@GetMapping("/musicSelectBymusicId/{musicId}") 
	public MusicVO musicList(@PathVariable int musicId, Model model) {
		MusicVO vo = new MusicVO();
		vo = musicDAO.musicSelect(musicId);
		return vo;
	}
	
	@ResponseBody
	@GetMapping("/albumSelectBymusicId/{musicId}") 
	public AlbumVO albumSelectBymusicId(@PathVariable int musicId, Model model,HttpServletRequest req) {
		AlbumVO vo = new AlbumVO();
		vo = albumDAO.albumSelectByMusicId(musicId);
		String id = req.getParameter("id");
		System.out.println(id);
		return vo;
	}
	
	
	@ResponseBody
	@PostMapping("/addWishList") 
	public void addWishList(@RequestBody MusicVO vo, Model model) {
		//제목이랑 가수이름으로 musicId를 찾고 그 뮤직아이디를 해당 위시리스트에 넣는다
		int musicId = musicDAO.musicIdByTitle(vo);
		
		
		//int r = musicDAO.insertWishList(musicId);
		//System.out.println(title);
		
	}
	

}
