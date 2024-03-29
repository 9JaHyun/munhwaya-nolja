package com.munhwa.prj.member.web;

import com.munhwa.prj.artist.service.ArtistService;
import com.munhwa.prj.common.code.entity.Genre;
import com.munhwa.prj.common.file.entity.UploadFile;
import com.munhwa.prj.common.file.service.FileUtils;
import com.munhwa.prj.config.auth.LoginUser;
import com.munhwa.prj.config.auth.entity.SessionUser;
import com.munhwa.prj.member.service.MemberService;
import com.munhwa.prj.member.vo.Auth;
import com.munhwa.prj.member.vo.MemberVO;
import com.munhwa.prj.news.service.NewsService;
import java.io.IOException;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class MemberController {

    private final MemberService memberService;
    private final NewsService newsService;
    private final ArtistService artistService;
    private final FileUtils fileUtils;
    private final PasswordEncoder passwordEncoder;

    public MemberController(MemberService memberService,
          NewsService newsService, ArtistService artistService,
          FileUtils fileUtils,
          PasswordEncoder passwordEncoder) {
        this.memberService = memberService;
        this.newsService = newsService;
        this.artistService = artistService;
        this.fileUtils = fileUtils;
        this.passwordEncoder = passwordEncoder;
    }

    // 마이페이지 (+ 새소식리스트)
    @PreAuthorize("hasRole('R01')")
    @GetMapping("/mypage.do")
    public String mypage(@LoginUser SessionUser sessionUser, Model model) {
        model.addAttribute("news1", newsService.findByMemberId(sessionUser.getId()));
        return "mypage-member";
    }

    // 회원정보 변경 페이지
    @GetMapping("/memberChangeInfo.do")
    public String memberChangeInfo(@LoginUser SessionUser user, Model model) {
    	model.addAttribute("artists", artistService.findByMemberId(user.getId()));
        return "memberChangeInfo-member";
    }

    // 프로필 변경 페이지
    @GetMapping("/changeProfile.do")
    public String changeProfile() {
        return "changeProfile-member";
    }

    // 프로필 업데이트
    @PostMapping("updateProfile.do")
    public String updateProfile(@LoginUser SessionUser user,  MemberVO vo, MultipartFile file
    		, @RequestParam("basicImgInput") String basicImgInput) throws IOException {

    	// 기존 프로필 사진이 있는 경우 백업
        vo.setOname(user.getOname());
        vo.setSname(user.getSname());

        if(basicImgInput.equals("basic")) {
        	vo.setOname(null);
        	vo.setSname(null);

            user.setSname(null);
            user.setOname(null);
        }

        if (file != null && file.getSize() != 0) {
            UploadFile upload = fileUtils.storeFile(file);
            String oname = upload.getOriginalFileName();
            String sname = upload.getStoredFileName();
        
            // 새로운 프로필 사진이 있는 경우 덮어 씌우기
            vo.setOname(oname);
            vo.setSname(sname);
            user.setSname(sname);
            user.setOname(oname);
        }
        
        if (vo.getNickname() != null) {
            user.setNickname(vo.getNickname());
        }

        int n = memberService.updateProfile(vo);
        if (n != 0) {
            return "redirect:changeProfile.do";
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
    public String updateInfo(@LoginUser SessionUser user,  MemberVO vo) {
        int n = memberService.updateInfo(vo);

        if (vo.getGenre() != null) {
            user.setGenre(Genre.valueOf(vo.getGenre()));
        }

        if (vo.getGenre() != null) {
            user.setTel(vo.getTel());
        }

        if (n != 0) {
            return "redirect:changeInfo.do";
        } else {
            return "error/404";
        }
    }
    
    // 비밀번호 변경 페이지 - 현재 비밀번호 확인 폼
    @GetMapping("/checkPassword.do")
    public String checkPasswordForm() {
    	return "checkPassword-member";
    }
    
    // 비밀번호 변경 페이지 - 현재 비밀번호 확인
    @PostMapping("/checkPassword.do")
    public String checkPassword(RedirectAttributes attr, MemberVO vo, @LoginUser SessionUser user) {
    	if (passwordEncoder.matches(vo.getPassword(), user.getPassword())) {
    		return "redirect:changePassword.do";
    	} else {
            String message = "비밀번호가 일치하지 않습니다.";
            attr.addFlashAttribute("message", message);
            return "redirect:checkPassword.do";
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
        vo.setPassword(passwordEncoder.encode(password1));
        int n = memberService.updatePassword(vo);
        if (n != 0) {
        	SecurityContextHolder.clearContext();
            return "redirect:home.do";
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
    public String deleteMember(RedirectAttributes attr, MemberVO vo, @LoginUser SessionUser user) {
        int n = 0;
        if (passwordEncoder.matches(vo.getPassword(), user.getPassword())) {
            n = memberService.deleteMember(vo);
            SecurityContextHolder.clearContext();
        }
        if (n != 0) {
            return "redirect:home.do";
        } else {
            String message = "비밀번호가 일치하지 않습니다.";
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
        int n = memberService.signup(vo);
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

    // 비밀번호 찾기 페이지
    @GetMapping("/findPassword")
    public String findPassword() {
        return "signup/findPassword";
    }

    // 아이디 중복체크
    @ResponseBody
    @PostMapping("/chkId")
    public int chkId(String id) {
        return memberService.chkId(id);
    }

    // 닉네임 중복체크
    @ResponseBody
    @PostMapping("/chkNick")
    public int chkNick(String nickname) {
        return memberService.chkNick(nickname);
    }

    // 아이디 찾기 결과
    @PostMapping("/findIdResult")
    public String findIdResult(MemberVO vo, Model model) {
        model.addAttribute("idLists", memberService.findIdList(vo));
        return "signup/findIdResult";
    }

    // 비밀번호 찾기 메일 발송
    @ResponseBody
    @RequestMapping(value = "/findpw", produces = "application/x-www-form-urlencoded; charset=UTF-8")
    public String findPwPOST(@ModelAttribute MemberVO member) throws Exception {
        if (!memberService.findPw(member)) {
            return "해당되는 아이디가 존재하지 않습니다.";
        }
        return "해당 메일로 임시 비밀번호가 전송되었습니다.";
    }
}
