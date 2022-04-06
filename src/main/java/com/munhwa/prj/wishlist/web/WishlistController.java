package com.munhwa.prj.wishlist.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.munhwa.prj.wishlist.service.WishlistService;

@Controller
public class WishlistController {
	
	@Autowired
	private WishlistService wishlistDao;
	

    // 위시리스트 리스트
   	@GetMapping("/wishlist.do")
   	public String wishlistList(HttpServletRequest request, Model model) {
   		model.addAttribute("wishlists", wishlistDao.wishlistList("test0@gmail.com"));
   		return "wishlist-member";
   	}
   	
   	// 위시리스트 곡 리스트
   	@GetMapping("wishlistMusic.do")
   	public String wishlistMusic(HttpServletRequest request,  Model model, @RequestParam int id) {
   		String wishlistId = Integer.toString(id);
   		model.addAttribute("wishlistMusic", wishlistDao.wishlistMusicList("test0@gmail.com", wishlistId));
   		return "wishlistMusic-member";
   	}
   	
   	@ResponseBody
   	@PostMapping("addWishList") 
   	public void addWishList(@RequestBody Map<String, Integer> param){
   		int musicId =  param.get("musicId");
   		int wishId =  param.get("wishId");
   		wishlistDao.insertWishlist(musicId, wishId);
   		
   	}
   	
   	@ResponseBody
   	@PostMapping("addWishList2") 
   	public void addWishList2(@RequestParam (value="wishId") int wishId, 
   							 @RequestParam (value="musicIdList")  List<Integer> musicIdList){
   		Map<String, Integer> paramMap = new HashMap<>();
   		for(int musicId : musicIdList) {
   			paramMap.put("v_wishlist_id", wishId);
   			paramMap.put("v_music_id", musicId);
   			wishlistDao.insertWishlist2(paramMap);
   		}
   		
   	}
}
