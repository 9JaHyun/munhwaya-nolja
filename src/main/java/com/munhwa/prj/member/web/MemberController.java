package com.munhwa.prj.member.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.munhwa.prj.member.service.MemberService;
import com.munhwa.prj.member.vo.MemberVO;

@Controller
public class MemberController {

    @Autowired
    private MemberService memberDao;
    
    // 로그인 대체
    @GetMapping("/createMember")
    public @ResponseBody String createMember(HttpServletRequest req) {
    	MemberVO memberVO = new MemberVO();
    	memberVO.setId("test1@gmail.com");
    	memberVO = memberDao.mypageInfo(memberVO);
        req.getSession().setAttribute("member", memberVO);
        return "OK";
    }

    // 마이페이지
    @GetMapping("/mypage.do")
    public String mypage(HttpServletRequest req, Model model) {
    	MemberVO vo = (MemberVO) req.getSession().getAttribute("member");
    	if (vo != null) {
    		return "mypage-member";
    	} else {
    		return "error/404";
    	}
    }
    
    // 회원정보 변경 페이지
    @GetMapping("/memberChangeInfo.do")
    public String memberChangeInfo() {
    	return "memberChangeInfo-member";
    }

    // 프로필 변경 페이지
    @GetMapping("/changeProfile.do")
    public String changeProfile() {
    	return "changeProfile-member";
    }
    
    // 개인정보 변경 페이지
    @GetMapping("/changeInfo.do")
    public String changeInfo() {
    	return "changeInfo-member";
    }
    
    // 개인정보 업데이트
	@PostMapping("updateInfo.do")
	public String updateInfo(MemberVO vo) {
		int n = memberDao.updateInfo(vo);
		if (n != 0) {
			return "redirect:memberChangeInfo.do";
		} else {			
			return "error/404";
		}
	}
    
    // 비밀번호 변경 페이지
    @GetMapping("/changePassword.do")
    public String changePassword() {
    	return "changePassword-member";
    }
    
    // 비밀번호 업데이트
	@PostMapping("updatePassword.do")
	public String updatePassword(MemberVO vo) {
		int n = memberDao.updatePassword(vo);
		if (n != 0) {
			return "redirect:memberChangeInfo.do";
		} else {			
			return "error/404";
		}
	}
    
    // 회원탈퇴 페이지
    @GetMapping("/dropMember.do")
    public String dropMember() {
    	return "dropMember-member";
    }
    
    // 회원탈퇴
    @PostMapping("/deleteMember.do")
    public String deleteMember(MemberVO vo) {
    	int n = memberDao.deleteMember(vo);
    	if (n != 0) {
    		return "redirect:home.do";
    	} else {
    		return "error/404";
    	}
    }  
    
    // 회원가입폼
    @GetMapping("/signupForm.do")
    public String signupForm() {
        return "signup/signupForm";
    }

    // 회원가입
    @PostMapping("memberSignup.do")
    public String memberSignup(MemberVO vo) {

        int n = memberDao.memberSignup(vo);
        if (n != 0) {
            return "redirect:home.do";
        } else {
            return "error/404";
        }
    }


    // 아이디 중복체크
    @ResponseBody
    @PostMapping( "/idChk")
    public int idChk(String id) {
        return memberDao.idChk(id);
    }

    // 닉네임 중복체크
    @ResponseBody
    @PostMapping("/nickChk")
    public int nickChk(String nickname) {
        return memberDao.nickChk(nickname);
    }

}
