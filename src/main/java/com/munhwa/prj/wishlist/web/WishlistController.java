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
    public String wishlistMusic(@LoginUser SessionUser user, Model model, @RequestParam int id,
          @RequestParam String name) {
        String wishlistId = Integer.toString(id);
        model.addAttribute("wishlistName", name);
        model.addAttribute("wishlistMusic",
              wishlistDao.wishlistMusicList(user.getId(), wishlistId));
        return "wishlistMusic-member";
    }

    // 위시리스트 곡 삭제
    @PostMapping("deleteWishlistMusic.do")
    public @ResponseBody
    String deleteWishlistMusic(@RequestParam int musicId, @RequestParam int wishId,
          @RequestParam String name) {
        wishlistDao.deleteWishlistMusic(musicId, wishId);
        return "redirect:wishlistMusic.do?id=" + wishId + "&name=" + name;
    }

    // 위시리스트 곡 추가
    @ResponseBody
    @PostMapping("addWishList")
    public void addWishList(@RequestBody Map<String, Integer> param) {
        int musicId = param.get("musicId");
        int wishId = param.get("wishId");
        wishlistDao.insertWishlist(musicId, wishId);
    }

    @ResponseBody
    @PostMapping("addWishList2")
    public void addWishList2(@RequestParam(value = "wishId") int wishId,
          @RequestParam(value = "musicIdList") List<Integer> musicIdList) {
        Map<String, Integer> paramMap = new HashMap<>();
        for (int musicId : musicIdList) {
            paramMap.put("v_wishlist_id", wishId);
            paramMap.put("v_music_id", musicId);
            wishlistDao.insertWishlist2(paramMap);
        }
    }

    @ResponseBody
    @PostMapping("createWishList")
    public WishlistVO addWishList2(@RequestBody WishlistVO vo, @LoginUser SessionUser user) {
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("v_name", vo.getName());
        paramMap.put("v_member_id", user.getId());
        paramMap.put("p_id", 0);
        wishlistDao.createWishList(paramMap);

        int id = (int) paramMap.get("p_id");
        vo.setId(id);
        return vo;
    }

    // 마이페이지 - 위시리스트 추가
    @PostMapping("addWishlist.do")
    public String addWishlist(@LoginUser SessionUser sessionUser, WishlistVO vo) {
        String memberId = sessionUser.getId();
        vo.setMemberId(memberId);
        wishlistDao.addWishlist(vo);
        return "redirect:wishlist.do";
    }
}