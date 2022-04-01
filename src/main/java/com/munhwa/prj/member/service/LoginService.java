package com.munhwa.prj.member.service;

import com.munhwa.prj.member.mapper.MemberMapper;
import com.munhwa.prj.member.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Slf4j
@Service
public class LoginService implements UserDetailsService {

    private final MemberMapper memberMapper;
    private final PasswordEncoder passwordEncoder;

    public LoginService(MemberMapper memberMapper) {
        this.memberMapper = memberMapper;
        this.passwordEncoder = new BCryptPasswordEncoder();
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        log.info("loadUserByUsername={}", username);
        MemberVO member = memberMapper.selectByMemberId(username);
        if (member == null) {
            throw new UsernameNotFoundException(username);
        }
        return User.builder()
              .username(member.getId())
              .password(member.getPassword())
              .roles(member.getRole())
              .build();
    }


}
