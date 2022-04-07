package com.munhwa.prj.config.auth.service;

import com.munhwa.prj.config.auth.OAuthAttributes;
import com.munhwa.prj.member.mapper.MemberMapper;
import com.munhwa.prj.member.vo.MemberVO;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserService;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.DefaultOAuth2User;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

@Slf4j
@RequiredArgsConstructor
@Service
public class CustomOauth2UserService implements OAuth2UserService<OAuth2UserRequest, OAuth2User> {
    private final MemberMapper memberMapper;
//    private final HttpSession httpSession;

    @Override
    public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
        log.info("CustomOauth2UserService activate");

        OAuth2UserService<OAuth2UserRequest, OAuth2User>
              delegate = new DefaultOAuth2UserService();
        OAuth2User oAuth2User = delegate.loadUser(userRequest);

        String registrationId = userRequest.getClientRegistration().getRegistrationId();

        String userNameAttributeName = userRequest
              .getClientRegistration().getProviderDetails()
              .getUserInfoEndpoint().getUserNameAttributeName();

        OAuthAttributes attributes = OAuthAttributes.of(registrationId, userNameAttributeName,
              oAuth2User.getAttributes());

        MemberVO memberVO = saveOrUpdate(attributes);

//        httpSession.setAttribute("member", new SessionUser(memberVO));
        return new DefaultOAuth2User(
              Collections.singleton(new SimpleGrantedAuthority("ROLE_" + memberVO.getRole())),
              attributes.getAttributes(),
              attributes.getNameAttributeKey());
    }

    // 최초 로그인이면 계정 저장, 소셜 계정의 정보가 바뀌었다면 수정
    private MemberVO saveOrUpdate(OAuthAttributes attributes) {
        MemberVO findMember = memberMapper.selectByMemberId(attributes.getEmail());
        MemberVO memberVO = Optional.ofNullable(findMember)
              .map(entity -> entity.update(attributes.getName(), attributes.getPicture()))
              .orElse(attributes.toEntity());

        memberMapper.memberOAuthSignup(toMap(memberVO));

        // update 수정
        return memberVO;
    }

    private Map<String, String> toMap(MemberVO vo) {
        Map<String, String> paramMap = new HashMap<>();
        paramMap.put("v_id", vo.getId());
        paramMap.put("v_password", vo.getPassword());
        paramMap.put("v_nickname", vo.getNickname());
        paramMap.put("v_tel", vo.getTel());
        paramMap.put("v_genre", vo.getGenre());
        paramMap.put("v_image", vo.getSname());
        return paramMap;
    }
}
