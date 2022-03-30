package com.munhwa.prj.wishlist.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class WishlistController {
	

    // 위시리스트 페이지
    @GetMapping("/wishlist.do")
    public String wishlist() {
    	return "wishlist-member";
    }

}
