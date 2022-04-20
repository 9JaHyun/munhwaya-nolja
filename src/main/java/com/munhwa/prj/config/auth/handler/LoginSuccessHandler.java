package com.munhwa.prj.config.auth.handler;

import com.munhwa.prj.config.auth.entity.SessionUser;
import com.munhwa.prj.member.mapper.MemberMapper;
import com.munhwa.prj.member.vo.MemberVO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import lombok.Getter;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;
import org.springframework.stereotype.Component;

@Getter
@Setter
@Slf4j
@Component
public class LoginSuccessHandler implements AuthenticationSuccessHandler {

    @Autowired
    private  MemberMapper memberMapper;
    private RequestCache requestCache = new HttpSessionRequestCache();
    private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();

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
            out.println(
                  "<script>alert('임시 비밀번호로 로그인하셨습니다.\\n비밀번호 변경 페이지로 이동합니다.'); location.href='changePassword.do';</script>");
            out.flush();
            return;
        }

        SavedRequest savedRequest = requestCache.getRequest(request, response);
        log.info("savedRequest = {}", savedRequest.getRedirectUrl());

        if(savedRequest != null) {
            String targetUrl = savedRequest.getRedirectUrl();
            redirectStrategy.sendRedirect(request, response, targetUrl);
        } else {
            redirectStrategy.sendRedirect(request, response, request.getContextPath()+"/home.do");
        }
    }
}
