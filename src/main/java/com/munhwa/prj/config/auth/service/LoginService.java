package com.munhwa.prj.config.auth.service;

import com.munhwa.prj.config.auth.dto.SessionUser;
import com.munhwa.prj.member.mapper.MemberMapper;
import com.munhwa.prj.member.vo.MemberVO;
import javax.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Slf4j
@RequiredArgsConstructor
@Service
public class LoginService implements UserDetailsService {

    private final MemberMapper memberMapper;
    private final HttpSession httpSession;


    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        log.info("loadUserByUsername={}", username);
        MemberVO member = memberMapper.selectByMemberId(username);
        if (member == null) {
            throw new UsernameNotFoundException(username);
        }
        httpSession.setAttribute("member", new SessionUser(member));
        return User.builder()
              .username(member.getId())
              .password(member.getPassword())
              .roles(member.getRole())
              .build();
    }

}
