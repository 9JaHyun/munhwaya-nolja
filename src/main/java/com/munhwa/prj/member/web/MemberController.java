package com.munhwa.prj.member.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.munhwa.prj.member.service.MemberService;
import com.munhwa.prj.member.vo.MemberVO;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;

	// 마이페이지
	@GetMapping("/mypage.do")
	public String mypage() {
		return "mypage-member";
	}

	// 회원가입폼
	@GetMapping("/signupForm.do")
	public String signupForm() {
		return "signup/signupForm";
	}

	// 회원가입
	@PostMapping("memberSignup.do")
	public String memberSignup(MemberVO vo) {
		
		String genre = vo.getGenre();
		switch (genre) {
		case "발라드":
			vo.setGenre("G01");
			break;
		case "댄스":
			vo.setGenre("G02");
			break;
		case "랩/힙합":
			vo.setGenre("G03");
			break;
		case "R&B/Soul":
			vo.setGenre("G04");
			break;
		}

		int n = memberService.memberSignup(vo);
		if (n != 0) {
			return "redirect:home.do";
		} else {
			return "error/404";
		}
	}
	
	// 아이디 중복체크
	@ResponseBody
	@RequestMapping(value = "/idChk", method = RequestMethod.POST)
	public int idChk(String id) {
		int result = memberService.idChk(id);
		return result;
	}
	
	// 닉네임 중복체크
	@ResponseBody
	@RequestMapping(value = "/nickChk", method = RequestMethod.POST)
	public int nickChk(String nickname) {
		int result = memberService.nickChk(nickname);
		return result;
	}

}
