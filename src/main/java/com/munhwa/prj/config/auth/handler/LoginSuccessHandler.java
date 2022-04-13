package com.munhwa.prj.config.auth.handler;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import com.munhwa.prj.config.auth.dto.SessionUser;
import com.munhwa.prj.member.mapper.MemberMapper;
import com.munhwa.prj.member.vo.MemberVO;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
@Component
public class LoginSuccessHandler implements AuthenticationSuccessHandler {

    @Autowired private MemberMapper memberMapper;

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
          Authentication authentication) throws IOException, ServletException {
        String username = ((User) authentication.getPrincipal()).getUsername();
        MemberVO member = memberMapper.selectByMemberId(username);
        SessionUser user = new SessionUser(member);
        request.getSession().setAttribute("member", user);
        if (member.getPwChanged() == 1) {
        	response.setContentType("text/html; charset=UTF-8");
        	PrintWriter out = response.getWriter();
        	out.println("<script>alert('임시 비밀번호로 로그인하셨습니다.\\n비밀번호 변경 페이지로 이동합니다.'); location.href='changePassword.do';</script>");        	 
        	out.flush();
        	return;
        }
        response.sendRedirect("home.do");
    }
}
