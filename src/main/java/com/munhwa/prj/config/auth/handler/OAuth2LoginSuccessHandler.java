package com.munhwa.prj.config.auth.handler;

import com.munhwa.prj.config.auth.entity.SessionUser;
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
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;

@Slf4j
@Getter @Setter
public class OAuth2LoginSuccessHandler extends SimpleUrlAuthenticationSuccessHandler  {

    @Autowired private MemberMapper memberMapper;
    private RequestCache requestCache = new HttpSessionRequestCache();
    private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
          Authentication authentication) throws IOException {
        String username = ((DefaultOAuth2User) authentication.getPrincipal()).getAttribute("email");

        request.getSession().setAttribute("member",
              new SessionUser(memberMapper.selectByMemberId(username)));

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

