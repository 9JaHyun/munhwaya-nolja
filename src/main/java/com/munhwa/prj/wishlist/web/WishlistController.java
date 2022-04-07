package com.munhwa.prj.wishlist.web;

import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.munhwa.prj.config.auth.LoginUser;
import com.munhwa.prj.config.auth.dto.SessionUser;
import com.munhwa.prj.wishlist.service.WishlistService;
import com.munhwa.prj.wishlist.vo.WishlistVO;

@Controller
public class WishlistController {
	@Autowired
	private WishlistService wishlistDao;

    // 위시리스트 리스트
   	@GetMapping("/wishlist.do")
   	public String wishlistList(@LoginUser SessionUser user, Model model) {
   		model.addAttribute("wishlists", wishlistDao.wishlistList(user.getId()));
   		return "wishlist-member";
   	}
   	
   	// 위시리스트 삭제
    @PostMapping("/deleteWishlist.do")
    public String deleteWishlist(@RequestBody WishlistVO vo) {
    	wishlistDao.deleteWishlist(vo);
    	return "redirect:wishlist.do";
    } 
   	
   	// 위시리스트 곡 리스트
   	@GetMapping("wishlistMusic.do")
   	public String wishlistMusic(@LoginUser SessionUser user,  Model model, @RequestParam int id, @RequestParam String name) {
   		String wishlistId = Integer.toString(id);
   		model.addAttribute("wishlistName", name);
   		model.addAttribute("wishlistMusic", wishlistDao.wishlistMusicList(user.getId(), wishlistId));
   		return "wishlistMusic-member";
   	}
   	
   	// 위시리스트 곡 삭제
   	@PostMapping("deleteWishlistMusic.do")
   	public @ResponseBody String deleteWishlistMusic(@RequestParam int musicId, @RequestParam int wishId, @RequestParam String name) {
   		wishlistDao.deleteWishlistMusic(musicId, wishId);
   		return "redirect:wishlistMusic.do?id="+wishId+"&name="+name;
   	}
   	
   	// 위시리스트 곡 추가
   	@ResponseBody
    @PostMapping("addWishList")
    public void addWishList(@RequestBody Map<String, Integer> param){
       int musicId =  param.get("musicId");
       int wishId =  param.get("wishId");
       wishlistDao.insertWishlist(musicId, wishId);
    }

}
