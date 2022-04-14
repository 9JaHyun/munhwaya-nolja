package com.munhwa.prj.music.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
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
import com.munhwa.prj.music.vo.etc.MusicChartDto;
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

		model.addAttribute("musicChartList", musicDAO.musicSelectList(cri));// 갯수지정
		model.addAttribute("releaseSoonAlbumList", albumDAO.albumSelectListByRelease(cri));// 갯수지정
		model.addAttribute("musicPersonalList", musicDAO.musicPersonalList(id,cri));
		
		return "music/musicMain";
	}

	@GetMapping("/searchResult")
	public String searchResult(String title, Model model, Criteria cri) {
		model.addAttribute("musicSelectListByTitle", musicDAO.musicSelectByTitle(title,cri));
		model.addAttribute("albumSelectListByTitle", albumDAO.albumSelectByTitle(title,cri));
		model.addAttribute("title", title);
		return "music/searchResult";
	}

	@GetMapping("/searchResultMusic")
	public String searchResultMusic(@LoginUser SessionUser user, Model model, String title, Criteria cri) {
		model.addAttribute("title", title);
		
		List<MusicVO> list = musicDAO.musicSelectByTitle(title,cri);
		
		List<Integer> musicList = purchaseDao.purchaseSelectList(user.getId());
		
		List<MusicChartDto> chartList = new ArrayList<>();
		
		for(MusicVO vo : list) {
			
			MusicChartDto dto = new MusicChartDto(vo); 
			int ids = dto.getId();
			boolean isPurchased = false;
			
			for(int id : musicList) {
				if(ids == id) {
					isPurchased = true;
					break;
				}
			}
			dto.setPurchase(isPurchased);
			chartList.add(dto);//구입여부가 들어잇는 vo2를 jsp에 표시할 리스트모델에 담음
		}
		model.addAttribute("musicSelectListByTitle1", chartList);
		
		int total = musicDAO.getCountByList3(title);
	    PageDTO pageMake = new PageDTO(cri, total);
	    model.addAttribute("pageMaker", pageMake);
	    
		return "music/searchResultMusic";
	}

	@GetMapping("/searchResultAlbum")
	public String searchResultAlbum(Model model, String title, Criteria cri) {
		System.out.println(title);
		model.addAttribute("title", title);
		model.addAttribute("albumSelectListByTitle1", albumDAO.albumSelectByTitle(title,cri));
		
		int total = albumDAO.getCountByList4(title);
	    PageDTO pageMake = new PageDTO(cri, total);
	    model.addAttribute("pageMaker", pageMake);
	    
		return "music/searchResultAlbum";
	}

	@GetMapping("/chart")
	public String chart(@LoginUser SessionUser user, Model model, Criteria cri) {
		
		//원래 차트에 표시될 음원의 리스트
		List<MusicVO> list = musicDAO.musicSelectList(cri); //여기서 페이징처리후 다가져온다?  1-10까지검색 => 11-20까지 검색
		
		//아이디 넣으면 구매한 음원의 아이디 목록 나옴
		List<Integer> musicList = purchaseDao.purchaseSelectList(user.getId());
		
		//차트에 표시할 Dto를 담을 리스트
		List<MusicChartDto> chartList = new ArrayList<>();
		
		//차트의 음원리스트와 
		for(MusicVO vo : list) {
			
			MusicChartDto dto = new MusicChartDto(vo); //차트리스트의 음원을 구입여부가있는 vo2에 넣어줌
			int ids = dto.getId();
			boolean isPurchased = false;
			
			for(int id : musicList) {
				if(ids == id) {
					isPurchased = true;
					break;
				}
			}
			dto.setPurchase(isPurchased);
			chartList.add(dto);
		}
		int total = 50;
	    PageDTO pageMake = new PageDTO(cri, total);
	    model.addAttribute("pageMaker", pageMake);
	    
		model.addAttribute("musicChartList", chartList);// 갯수지정
		return "music/chart";
	}
	
	@GetMapping("/releaseSoon")
	public String releaseSoon(Model model, Criteria cri) {
		
		List<AlbumVO> list =  albumDAO.albumSelectListByRelease(cri);
		model.addAttribute("releaseSoonAlbumList", list);
		
		int total = 20;
	    PageDTO pageMake = new PageDTO(cri, total);
	    model.addAttribute("pageMaker", pageMake);
		return "music/releaseSoon";
	}

	@GetMapping("/albumInfo")
	public String albumInfo(@LoginUser SessionUser user, Model model, int id) {
		
		//원래 차트에 표시될 음원의 리스트
		List<MusicVO> list =  musicDAO.musicSelectByAlBum(id); 
				
		//아이디 넣으면 구매한 음원의 아이디 목록 나옴
		List<Integer> musicList = purchaseDao.purchaseSelectList(user.getId());
				
		//차트에 표시할 Dto를 담을 리스트
		List<MusicChartDto> chartList = new ArrayList<>();
				
		//차트의 음원리스트와 
		for(MusicVO vo : list) {
					
			MusicChartDto dto = new MusicChartDto(vo); //차트리스트의 음원을 구입여부가있는 vo2에 넣어줌
			int ids = dto.getId();
			boolean isPurchased = false;
					
			for(int id1 : musicList) {
				if(ids == id1) {
				isPurchased = true;
				break;
				}
			}
				dto.setPurchase(isPurchased);
				chartList.add(dto);
				}
		
		model.addAttribute("selectAlbum", albumDAO.albumSelect(id));
		model.addAttribute("selectMusicByAlbum",chartList);
		model.addAttribute("wishlists", wishlistDao.wishlistList(user.getId()));
		return "music/albumInfo";
	}
	
	@GetMapping("/streaming")
	public String streaming(Model model, int id, @LoginUser SessionUser user) {
		
		MusicVO vo = musicDAO.musicSelect(id);
		
		List<Integer> musicList = purchaseDao.purchaseSelectList(user.getId());
		
		for(int id1 : musicList) {
			if(id == id1) {
				model.addAttribute("buyButton", '1');
				break;
			} else {
				model.addAttribute("buyButton", '2');
			}
		}
		
		model.addAttribute("musicSelect", vo);
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
				
		List<MusicVO> list = musicDAO.musicPersonalList(user.getId(), cri);
		
		List<Integer> musicList = purchaseDao.purchaseSelectList(user.getId());
		
		List<MusicChartDto> chartList = new ArrayList<>();
		
		for(MusicVO vo : list) {
			
			MusicChartDto dto = new MusicChartDto(vo); 
			int ids = dto.getId();
			boolean isPurchased = false;
			
			for(int id : musicList) {
				if(ids == id) {
					isPurchased = true;
					break;
				}
			}
			dto.setPurchase(isPurchased);
			chartList.add(dto);//구입여부가 들어잇는 vo2를 jsp에 표시할 리스트모델에 담음
		}
		
 		model.addAttribute("musicPersonalList", chartList);
 		
		int total = musicDAO.getCountByList(user.getId());
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
	public String purchase(@LoginUser SessionUser user, Model model, Criteria cri) {
		String id = user.getId();
		model.addAttribute("purchasedList", purchaseDao.purchaseSelectList2(id,cri));
		int total = purchaseDao.getCountByList5(id);
	    PageDTO pageMake = new PageDTO(cri, total);
	    model.addAttribute("pageMaker", pageMake);
		return "music/purchase";
	}
	
	@ResponseBody
	@GetMapping("/musicSelectByArtName")
	public Map<String, Object> musicSelectByArtName(@LoginUser SessionUser user, @RequestParam String title, @RequestParam String artName) {
		Map<String, Object> map = new HashMap<>();
		MusicVO vo = musicDAO.musicSelectByArtName(title, artName );
		int id = vo.getId();
		map.put("id", id);
		List<Integer> musicList = purchaseDao.purchaseSelectList(user.getId());
		for (int ids :  musicList) {
			if(id == ids) {
				map.put("purchased", 1);
				break;
			}
		}
		return map;
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
