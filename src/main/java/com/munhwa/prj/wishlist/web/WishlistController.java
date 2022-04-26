package com.munhwa.prj.wishlist.web;

import java.util.HashMap;
import java.util.List;
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
import com.munhwa.prj.config.auth.entity.SessionUser;
import com.munhwa.prj.wishlist.service.WishlistService;
import com.munhwa.prj.wishlist.vo.WishlistVO;

@Controller
public class WishlistController {

    @Autowired
    private WishlistService wishlistService;

    // 위시리스트 리스트
    @GetMapping("/wishlist.do")
    public String wishlistList(@LoginUser SessionUser user, Model model) {
        model.addAttribute("wishlists", wishlistService.wishlistList(user.getId()));
        return "wishlist-member";
    }

    // 위시리스트 삭제
    @PostMapping("/deleteWishlist.do")
    public String deleteWishlist(@RequestBody WishlistVO vo) {
        wishlistService.deleteWishlist(vo);
        return "redirect:wishlist.do";
    }

    // 위시리스트 곡 리스트
    @GetMapping("wishlistMusic.do")
    public String wishlistMusic(@LoginUser SessionUser user, Model model, @RequestParam int id,
          @RequestParam String name) {
        String wishlistId = Integer.toString(id);
        model.addAttribute("wishlistName", name);
        model.addAttribute("wishMusic",
              wishlistService.wishlistMusicList(user.getId(), wishlistId));
        model.addAttribute("wishlistId", id);
        return "wishlistMusic-member";
    }

    // 위시리스트 곡 삭제
    @PostMapping("deleteWishlistMusic.do")
    public @ResponseBody
    String deleteWishlistMusic(@RequestParam int musicId, @RequestParam int wishId,
          @RequestParam String name) {
        wishlistService.deleteWishlistMusic(musicId, wishId);
        return "redirect:wishlistMusic.do?id=" + wishId + "&name=" + name;
    }

    // 위시리스트 곡 추가
    @ResponseBody
    @PostMapping("addWishList")
    public void addWishList(@RequestBody Map<String, Integer> param) {
        int musicId = param.get("musicId");
        int wishId = param.get("wishId");
        wishlistService.insertWishlist(musicId, wishId);
    }

    @ResponseBody
    @PostMapping("addWishList2")
    public void addWishList2(@RequestParam(value = "wishId") int wishId,
          @RequestParam(value = "musicIdList") List<Integer> musicIdList) {
        Map<String, Integer> paramMap = new HashMap<>();
        for (int musicId : musicIdList) {
            paramMap.put("v_wishlist_id", wishId);
            paramMap.put("v_music_id", musicId);
            wishlistService.insertWishlist2(paramMap);
        }
    }

    @ResponseBody
    @PostMapping("createWishList")
    public WishlistVO addWishList2(@RequestBody WishlistVO vo, @LoginUser SessionUser user) {
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("v_name", vo.getName());
        paramMap.put("v_member_id", user.getId());
        paramMap.put("p_id", 0);
        wishlistService.createWishList(paramMap);

        int id = (int) paramMap.get("p_id");
        vo.setId(id);
        return vo;
    }

    // 마이페이지 - 위시리스트 추가
    @PostMapping("addWishlist.do")
    public String addWishlist(@LoginUser SessionUser sessionUser, WishlistVO vo) {
        String memberId = sessionUser.getId();
        vo.setMemberId(memberId);
        wishlistService.addWishlist(vo);
        return "redirect:wishlist.do";
    }

    // 위시리스트 곡 순서변경
    @PostMapping("changeOrders.do")
    @ResponseBody
    public String changeOrders(@RequestParam int id, int from, int to) {
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("v_wishlist_id", id);
        paramMap.put("v_to", to);
        paramMap.put("v_from", from);
        wishlistService.updateMusicOrders(paramMap);
        return "ok";
    }

}