package com.munhwa.prj.likeArtist.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LikeArtistController {
	
    // 좋아요 한 아티스트
    @GetMapping("/likeArtist.do")
    public String likeArtist() {
    	return "likeArtist-member";
    }

}
