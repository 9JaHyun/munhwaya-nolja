package com.munhwa.prj.member.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MemberController {
	
	 @GetMapping("/mypage.do")
	    public String mypage() {
	        return "mypage-member";
	    }
	 
	 @GetMapping("/signup.do")
	    public String signup() {
	        return "signup/signup";
	    }

}
