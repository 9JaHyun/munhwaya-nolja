package com.munhwa.prj.config.auth.handler;

import com.munhwa.prj.config.auth.dto.SessionUser;
import com.munhwa.prj.member.mapper.MemberMapper;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import lombok.Getter;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

@Slf4j
@Getter @Setter
@Component
public class LoginSuccessHandler implements AuthenticationSuccessHandler {

    @Autowired private MemberMapper memberMapper;

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
          Authentication authentication) throws IOException, ServletException {
        String username = ((User) authentication.getPrincipal()).getUsername();

        request.getSession().setAttribute("member", new SessionUser(memberMapper.selectByMemberId(username)));
        response.sendRedirect("home.do");
    }
}
