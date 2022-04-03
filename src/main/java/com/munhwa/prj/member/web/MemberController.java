package com.munhwa.prj.member.web;

import com.munhwa.prj.member.vo.Auth;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.munhwa.prj.member.service.MemberService;
import com.munhwa.prj.member.vo.MemberVO;

@Controller
public class MemberController {

    @Autowired
    private MemberService memberDao;
    @Autowired
    private PasswordEncoder passwordEncoder;
    @Autowired
    private HttpSession httpSession;

    // 마이페이지
    @PreAuthorize("hasRole('R01')")
    @GetMapping("/mypage.do")
    public String mypage() {
        return "mypage-member";
    }
    
    // 회원정보 변경 페이지
    @GetMapping("/memberChangeInfo.do")
    public String memberChangeInfo() {
    	return "memberChangeInfo-member";
    }

    // 프로플 변경 페이지
    @GetMapping("/changeProfile.do")
    public String changeProfile() {
    	return "changeProfile-member";
    }
    
    // 개인정보 변경 페이지
    @GetMapping("/changeInfo.do")
    public String changeInfo() {
    	return "changeInfo-member";
    }
    
    // 비밀번호 변경 페이지
    @GetMapping("/changePassword.do")
    public String changePassword() {
    	return "changePassword-member";
    }
    
    // 회원탈퇴 변경 페이지
    @GetMapping("/dropMember.do")
    public String dropMember() {
    	return "dropMember-member";
    }
    
    // 회원가입폼
    @GetMapping("/signupForm.do")
    public String signupForm() {
        return "signup/signupForm";
    }

    // 회원가입
    @PostMapping("/signup.do")
    public String memberSignup(MemberVO vo) {
        vo.setGenre(chooseGenre(vo.getGenre()));
        vo.setPassword(passwordEncoder.encode(vo.getPassword()));
        vo.setRole(Auth.R01.toString());

        int n = memberDao.memberSignup(vo);
        if (n != 0) {
            return "redirect:home.do";
        } else {
            return "error/404";
        }
    }

    // 로그인폼
    @GetMapping("/signin")
    public String signInForm() {
        return "signIn/signInForm";
    }

    private String chooseGenre(String genre) {
        String result;
        switch (genre) {
            case "발라드":
                result = "G01";
                break;
            case "댄스":
                result = "G02";
                break;
            case "랩/힙합":
                result = "G03";
                break;
            case "R&B/Soul":
                result = "G04";
                break;
            default:
                throw new AssertionError("정확하지 않은 장르입니다.");
        }
        return result;
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
