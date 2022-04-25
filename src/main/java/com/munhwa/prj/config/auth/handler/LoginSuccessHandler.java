package com.munhwa.prj.config.auth.handler;

import com.munhwa.prj.artist.mapper.ArtistMapper;
import com.munhwa.prj.artist.vo.ArtistVO;
import com.munhwa.prj.config.auth.entity.SessionUser;
import com.munhwa.prj.member.mapper.MemberMapper;
import com.munhwa.prj.member.vo.MemberVO;
import java.io.IOException;
import java.io.PrintWriter;
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
@Component
@Slf4j
public class LoginSuccessHandler implements AuthenticationSuccessHandler {

    @Autowired private MemberMapper memberMapper;
    @Autowired private ArtistMapper artistMapper;
    private final RequestCache requestCache = new HttpSessionRequestCache();
    private final RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
          Authentication authentication) throws IOException {
        String username = ((User) authentication.getPrincipal()).getUsername();
        MemberVO member = memberMapper.selectByMemberId(username);
        SessionUser user = new SessionUser(member);

        request.getSession().setAttribute("member", user);

        if (isTemporalPassword(member)) {
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println(
                  "<script>alert('임시 비밀번호로 로그인하셨습니다.\\n비밀번호 변경 페이지로 이동합니다.'); location.href='changePassword.do';</script>");
            out.flush();
            return;
        }

        if (isNewArtist(member)) {
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println(
                  "<script>alert('아티스트로 승급되었습니다!\\n아티스트 정보 등록 페이지로 이동합니다.'); location.href='artistProfileForm';</script>");
            out.flush();
            return;
        }

        SavedRequest savedRequest = requestCache.getRequest(request, response);

        if (savedRequest != null) {
            String targetUrl = savedRequest.getRedirectUrl();
            redirectStrategy.sendRedirect(request, response, targetUrl);
        } else {
            redirectStrategy.sendRedirect(request, response, "/home.do");
        }
    }

    private boolean isTemporalPassword(MemberVO member) {
        return member.getPwChanged() == 1;
    }

    private boolean isNewArtist(MemberVO member) {
        String memberRole = member.getRole();
        ArtistVO artist = artistMapper.findByMemberId(member.getId());

        return memberRole.equals("R02") && (artist == null);
    }
}
