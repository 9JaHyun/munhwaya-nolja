package com.munhwa.prj.config.auth.service;

import com.munhwa.prj.config.auth.OAuthAttributes;
import com.munhwa.prj.config.auth.dto.SessionUser;
import com.munhwa.prj.member.mapper.MemberMapper;
import com.munhwa.prj.member.vo.MemberVO;
import java.util.Collections;
import java.util.Optional;
import javax.servlet.http.HttpSession;
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
    private final HttpSession httpSession;

    @Override
    public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
        log.info("CustomOauth2UserService activate");

        OAuth2UserService<OAuth2UserRequest, OAuth2User>
              delegate = new DefaultOAuth2UserService();
        OAuth2User oAuth2User = delegate.loadUser(userRequest);

        // 현재 로그인 진행 중인 서비스를 구분하는 코드. (이후 네이버 카카오 연동 시 어느 로그인인지 파악 가능)
        String registrationId = userRequest.getClientRegistration().getRegistrationId();
        // OAuth2 로그인 진행 시 키가 되는 필드값 전달.
        // 구글의 경우 기본적으로 코드를 지원하나 카카오 네이버의 경우 지원 X (참고로 구글은 'sub'라는 기본코드로 지원)
        // 네이버 로그인과 구글 로그인을 동시 지원할때 사용.
        String userNameAttributeName = userRequest
              .getClientRegistration().getProviderDetails()
              .getUserInfoEndpoint().getUserNameAttributeName();

        // `OAuth2UserService`를 통해 가져온 `OAuth2User`의 attribute`를 담을 클래스.
        // 다른 소셜 로그인에도 사용됨.
        OAuthAttributes attributes = OAuthAttributes.of(registrationId, userNameAttributeName,
              oAuth2User.getAttributes());

        MemberVO memberVO = saveOrUpdate(attributes);

        // SessionUser: 세션에 사용자 정보를 저장하기 위한 Dto 클래스
        httpSession.setAttribute("member", new SessionUser(memberVO));
        return new DefaultOAuth2User(
              Collections.singleton(new
                    SimpleGrantedAuthority(memberVO.getRole())),
              attributes.getAttributes(),
              attributes.getNameAttributeKey());
    }

    private MemberVO saveOrUpdate(OAuthAttributes attributes) {
        MemberVO memberVO = Optional.ofNullable(memberMapper.selectByMemberId(attributes.getEmail()))
              .map(entity -> entity.update(attributes.getName(), attributes.getPicture()))
              .orElse(attributes.toEntity());

        // update 수정
        memberMapper.memberSignup(memberVO);
        return memberVO;
    }
}
