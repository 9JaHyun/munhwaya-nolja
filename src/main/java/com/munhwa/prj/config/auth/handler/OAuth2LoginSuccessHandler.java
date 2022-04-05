package com.munhwa.prj.config.auth.handler;

import com.munhwa.prj.config.auth.dto.SessionUser;
import com.munhwa.prj.member.mapper.MemberMapper;
import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import lombok.Getter;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.oauth2.core.user.DefaultOAuth2User;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;

@Slf4j
@Getter @Setter
public class OAuth2LoginSuccessHandler extends SimpleUrlAuthenticationSuccessHandler  {

    @Autowired private MemberMapper memberMapper;

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
          Authentication authentication) throws IOException {
        String username = ((DefaultOAuth2User) authentication.getPrincipal()).getAttribute("email");

        request.getSession().setAttribute("member",
              new SessionUser(memberMapper.selectByMemberId(username)));
        log.info("result={}", (DefaultOAuth2User) authentication.getPrincipal());
        response.sendRedirect("http://localhost/prj/");''
    }
}

