package com.munhwa.prj.music.web;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.munhwa.prj.music.service.AlbumService;
import com.munhwa.prj.music.service.MusicService;
import com.munhwa.prj.music.vo.AlbumVO;
import com.munhwa.prj.music.vo.MusicVO;
import com.munhwa.prj.wishlist.service.WishlistService;

@Controller
public class MusicController {
	@Autowired
	private MusicService musicDAO;
	@Autowired
	private AlbumService albumDAO;
	@Autowired
	private WishlistService wishlistDao;

	/* 페이지 요청 */
	@GetMapping("/musicMain")
	public String musicMain(Model model, HttpSession session) {
		/*
		 * Map<Integer, CartVO> map = (Map<Integer, cart>) session.getAttribute("cart");
		 * map.set(musicVO.getId(), musicVO) session.addAttribue("cart", map)
		 */
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
		model.addAttribute("wishlists", wishlistDao.wishlistList("test0@gmail.com"));
		return "music/streaming";
	}
	
	@GetMapping("/streamingWishList")
	public String streamingWishList(Model model, @RequestParam int id) {
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
	@PostMapping(value = "/updateLike", produces = "application/text; charset=UTF-8")
	public String updateLike(@RequestParam int musicId, HttpServletRequest req) {
		boolean val = true;
		@SuppressWarnings("unchecked")
		Map<String, ArrayList<Integer>> map = (Map<String, ArrayList<Integer>>) req.getSession().getAttribute("like");
		String id = (String) req.getSession().getAttribute("member");
		ArrayList<Integer> musicIdList = map.get(id);
		if(musicIdList.isEmpty()) {
			val= true;
		} else {
			for (Integer check : musicIdList) {
				Integer musicId1 = Integer.valueOf(musicId);
				if (check == musicId1) {
					val = false;
				}
			}
		}
		
		if(val) {
			musicDAO.updateLike(musicId);
			musicIdList.add(musicId);
			map.put(id, musicIdList);
			req.getSession().setAttribute("like", map);
			return "좋아요 하셨습니다";
		} else {
			return "이미 좋아요 하셨습니다.";
		}
	}
}
