package com.munhwa.prj.member.web;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.munhwa.prj.common.entity.UploadFile;
import com.munhwa.prj.common.entity.UploadFileVO;
import com.munhwa.prj.common.service.FileUtils;
import com.munhwa.prj.common.service.UploadFileService;
import com.munhwa.prj.config.auth.LoginUser;
import com.munhwa.prj.config.auth.dto.SessionUser;
import com.munhwa.prj.member.service.MemberService;
import com.munhwa.prj.member.vo.Auth;
import com.munhwa.prj.member.vo.MemberVO;
import com.munhwa.prj.news.service.NewsService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MemberController {

    @Autowired
    private MemberService memberDao;

    @Autowired
    private NewsService newsDao;

    @Autowired
    private PasswordEncoder passwordEncoder;
    
    @Autowired
    private FileUtils fileUtils;
    

    // 마이페이지 (+ 새소식리스트)
    @PreAuthorize("hasRole('R01')")
    @GetMapping("/mypage.do")
    public String mypage(@LoginUser SessionUser sessionUser, Model model) {
        model.addAttribute("news1", newsDao.newsList(sessionUser.getId()));
        return "mypage-member";
    }

    // 회원정보 변경 페이지
    @GetMapping("/memberChangeInfo.do")
    public String memberChangeInfo(@LoginUser SessionUser sessionUser) {
        return "memberChangeInfo-member";
    }

    // 프로필 변경 페이지
    @GetMapping("/changeProfile.do")
    public String changeProfile() {
        return "changeProfile-member";
    }
    
    // 프로필 업데이트
    @PostMapping("updateProfile.do")
    public String updateProfile(MemberVO vo, MultipartFile file) throws IOException {
    	System.out.println(file);
    	
    	if (file.getSize() != 0) {
    		UploadFile upload = fileUtils.storeFile(file);
    		vo.setOname(upload.getOriginalFileName());
    		vo.setSname(upload.getStoredFileName());
    		
    	}
    	int n = memberDao.updateProfile(vo);
    	if (n != 0) {
    		return "redirect:memberChangeInfo.do";
    	} else {
    		return "error/404";
    	}	
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
    public String updatePassword(MemberVO vo, String password1) {
    	System.out.println(password1);
    	vo.setPassword(passwordEncoder.encode(password1));
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
    public String deleteMember(RedirectAttributes attr, MemberVO vo , @LoginUser SessionUser user) {
        int n = 0;
    	if (passwordEncoder.matches(vo.getPassword(), user.getPassword()) == true) {
        	n = memberDao.deleteMember(vo);  
        	SecurityContextHolder.clearContext();
        }    
        if (n != 0) {
            return "redirect:home.do";
        } else {
        	String message ="비밀번호가 일치하지 않습니다.";
        	attr.addFlashAttribute("message", message);
            return "redirect:dropMember.do";
        }
    }

    // 회원가입폼
    @GetMapping("/signupForm.do")
    public String signupForm() {
        return "signup/signupForm";
    }

    // 회원가입
    @PostMapping("/signup.do")
    public String memberSignup(MemberVO vo) {
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
    
    // 아이디 찾기 페이지
    @GetMapping("/findId")
    public String findId() {
    	return "signup/findId";
    }
    
    // 아이디 찾기 결과
    @GetMapping("/findIdResult")
    public String findIdResult() {
    	return "signup/findIdResult";
    }
    
    // 비밀번호 찾기 페이지
    @GetMapping("/findPassword")
    public String findPassword() {
    	return "signup/findPassword";
    }
    

    // 아이디 중복체크
    @ResponseBody
    @PostMapping("/idChk")
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
