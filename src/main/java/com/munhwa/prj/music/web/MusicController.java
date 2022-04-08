package com.munhwa.prj.music.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.munhwa.prj.common.entity.UploadFile;
import com.munhwa.prj.common.entity.UploadFileVO;
import com.munhwa.prj.common.service.FileUtils;
import com.munhwa.prj.common.service.UploadFileService;
import com.munhwa.prj.common.vo.Criteria;
import com.munhwa.prj.common.vo.PageDTO;
import com.munhwa.prj.config.auth.LoginUser;
import com.munhwa.prj.config.auth.dto.SessionUser;
import com.munhwa.prj.music.service.AlbumService;
import com.munhwa.prj.music.service.MusicService;
import com.munhwa.prj.music.service.PurchaseService;
import com.munhwa.prj.music.vo.AlbumVO;
import com.munhwa.prj.music.vo.MusicVO;
import com.munhwa.prj.music.web.dto.MusicChartDto;
import com.munhwa.prj.wishlist.service.WishlistService;

@Controller
public class MusicController {
	@Autowired
	private MusicService musicDAO;
	@Autowired
	private AlbumService albumDAO;
	@Autowired
	private WishlistService wishlistDao;
	@Autowired
	private PurchaseService purchaseDao;
	@Autowired
	private UploadFileService uploadService;

	@GetMapping("/musicMain")
	public String musicMain(@LoginUser SessionUser user,  Model model, Criteria cri) {
		/*
		 * Map<Integer, CartVO> map = (Map<Integer, cart>) session.getAttribute("cart");
		 * map.set(musicVO.getId(), musicVO) session.addAttribue("cart", map)
		 */
		String id = user.getId();
		model.addAttribute("musicRnBList", musicDAO.musicSelectListByGenre("G04"));
		model.addAttribute("musicRapList", musicDAO.musicSelectListByGenre("G03"));
		model.addAttribute("musicDanceList", musicDAO.musicSelectListByGenre("G02"));
		model.addAttribute("musicBalladList", musicDAO.musicSelectListByGenre("G01"));

		model.addAttribute("musicChartList", musicDAO.musicSelectList());// 갯수지정
		model.addAttribute("releaseSoonAlbumList", albumDAO.albumSelectListByRelease());// 갯수지정
		model.addAttribute("musicPersonalList", musicDAO.musicPersonalList(id,cri));
		
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
		model.addAttribute("musicSelectListByTitle", musicDAO.musicSelectByTitle(title));
		return "music/searchResultMusic";
	}

	@GetMapping("/searchResultAlbum")
	public String searchResultAlbum(Model model, String title) {
		model.addAttribute("musicSelectListByTitle", musicDAO.musicSelectByTitle(title));
		return "music/searchResultAlbum";
	}

	@GetMapping("/chart")
	public String chart(@LoginUser SessionUser user, Model model) {
//		List<PurchaseVO> list = purchaseDao.purchaseSelectList(user.getId());
//		해당 회원이 구매한 음원 목록
//		List<Integer> musicList = purchaseDao.purchaseSelectList(user.getId());
//		
		List<MusicChartDto> chartList = new ArrayList<>();
//		
//		for(MusicVO vo : list) {
//			MusicChartDto dto = new MusicChartDto(vo);
//			int ids = dto.getId();
//			boolean isPurchased = false;
//			for(int id : musicList) {
//				if(vo.getId() == id) {
//					isPurchased = true;
//					break;
//				}
//			}
//			dto.setPurchase(isPurchased);
//			chartList.add(dto);
//		}
		
		model.addAttribute("musicChartList", chartList);// 갯수지정
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
		model.addAttribute("wishlists", wishlistDao.wishlistList("test0@gmail.com"));

		return "music/albumInfo";
	}

	@GetMapping("/streaming")
	public String streaming(Model model, int id, @LoginUser SessionUser user) {
		model.addAttribute("musicSelect", musicDAO.musicSelect(id));
		model.addAttribute("AlbumSelectByMusicId", albumDAO.albumSelectByMusicId(id));
		model.addAttribute("wishlists", wishlistDao.wishlistList(user.getId()));
		return "music/streaming";
	}
	
	@RequestMapping("/streamingList")
	public String streamingList(@RequestParam("musicIdList") List<Integer> musicIdList, Model model, @LoginUser SessionUser user) {
		int first = musicIdList.get(0);
		model.addAttribute("album", albumDAO.albumSelectByMusicId(first));
		
		Map<String, List<Integer>> paramMap = new HashMap<>();
		paramMap.put("musicIdList", musicIdList);
		model.addAttribute("musicList", musicDAO.musicSelectListByMusicId(paramMap));
		
		
		model.addAttribute("wishlists", wishlistDao.wishlistList(user.getId()));
		
		return "music/streamingList";
	}
	
	@GetMapping("/streamingWishList")
	public String streamingWishList(Model model, @RequestParam int id) {
		model.addAttribute("musicSelectListByWishList", musicDAO.musicSelectListByWishList(id));
		model.addAttribute("albumSelectListByWishList", albumDAO.albumSelectListByWishList(id));
		model.addAttribute("albumSelectByWishList", albumDAO.albumSelectByWishList(id)); // 위시리스트의 첫번째 곡의 앨범정보
		return "music/streamingWishList";
	}
	
	@GetMapping("/personalResult")
	public String personalResult(Model model, @LoginUser SessionUser user, Criteria cri) {
		String id = user.getId();
		List<MusicVO> list = musicDAO.musicPersonalList(id,cri);
 		model.addAttribute("musicPersonalList", list);
		  int total = musicDAO.getCountByList(21);
	      PageDTO pageMake = new PageDTO(cri, total);
	      model.addAttribute("pageMaker", pageMake);
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
	
	@GetMapping("/playAllAlbum")
	public String playAllAlbum(Model model) {
		model.addAttribute("musicRnBList", musicDAO.musicSelectListByGenre("G04"));
		model.addAttribute("musicRapList", musicDAO.musicSelectListByGenre("G03"));
		model.addAttribute("musicDanceList", musicDAO.musicSelectListByGenre("G02"));
		model.addAttribute("musicBalladList", musicDAO.musicSelectListByGenre("G01"));
		return "music/genre";
	}

	// 내가 구매한 음원 목록
	@GetMapping("/purchase")
	public String purchase(@LoginUser SessionUser user, Model model) {
		String id = user.getId();
		model.addAttribute("purchasedList", musicDAO.musicSelectListByPurchase(id));
		return "music/purchase";
	}
	
	@ResponseBody
	@GetMapping("/musicSelectByArtName")
	public MusicVO musicSelectByArtName(@RequestParam String title, @RequestParam String artName) {
		return musicDAO.musicSelectByArtName(title, artName );
	}
	
	@ResponseBody
	@GetMapping("/musicSelectBymusicId/{musicId}") 
	public MusicVO musicList(@PathVariable int musicId, Model model) {
		return musicDAO.musicSelect(musicId);
	}
	
	@ResponseBody
	@GetMapping("/albumSelectBymusicId/{musicId}") 
	public AlbumVO albumSelectBymusicId(@PathVariable int musicId, Model model, @LoginUser SessionUser user) {
		return albumDAO.albumSelectByMusicId(musicId);
	}

	@ResponseBody
	@PostMapping(value = "/updateLike", produces = "application/text; charset=UTF-8")
	public String updateLike(@RequestParam int musicId, @LoginUser SessionUser user) {
		Map<String, Object> paramMap = new HashMap<>();
		String id = user.getId();
		paramMap.put("v_member_id", id);
		paramMap.put("v_music_id", musicId);
		paramMap.put("p_result", 0);
		musicDAO.updateLike(paramMap);
		int r = (int) paramMap.get("p_result");
		if(r==0) {
			return "좋아요를 취소하셨습니다.";
		} else {
			return "좋아요 하셨습니다.";
		}
	}
	
	@ResponseBody
	@PostMapping("/upload")
	public String upload(MultipartFile file) throws IOException {
		FileUtils utils = new FileUtils();
		UploadFile uploadFile = utils.storeFile(file);
		UploadFileVO vo = new UploadFileVO();
		vo.setOname(uploadFile.getOriginalFileName());
		vo.setSname(uploadFile.getStoredFileName());		
		uploadService.save(vo);
		return "ok";
	}
	
	@ResponseBody
	@GetMapping("/getFiles/{fileId}")
	public UploadFileVO getFileSname(@PathVariable int fileId) {
		UploadFileVO vo = uploadService.findById(fileId);
		return vo;
	}
	
	@GetMapping("/chicken")
	public String chicken() {
		return "music/chicken";
	}
	
	
	
	
	
}
