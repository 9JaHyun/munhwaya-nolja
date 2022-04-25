package com.munhwa.prj.config.auth.entity;

import com.munhwa.prj.member.vo.Auth;
import com.munhwa.prj.member.vo.MemberVO;
import java.util.Map;
import lombok.Builder;
import lombok.Getter;
import lombok.extern.slf4j.Slf4j;


// OAuth2 인증 후 받는 추가정보
@Slf4j
@Getter
public class OAuthAttributes {
    private Map<String, Object> attributes;
    private String nameAttributeKey;
    private String name;
    private String email;
    private String picture;

    @Builder
    public OAuthAttributes(Map<String, Object> attributes,
          String nameAttributeKey, String name, String email, String picture) {
        this.attributes = attributes;
        this.nameAttributeKey = nameAttributeKey;
        this.name = name;
        this.email = email;
        this.picture = picture;
    }

    public static OAuthAttributes of(String registrationId, String userNameAttributeName,
          Map<String, Object> attributes) {
        log.info("registrationId: " + registrationId);
        if(registrationId.equals("naver")) {
            return ofNaver("id", attributes);
        }
        if(registrationId.equals("kakao")) return ofKakao("id", attributes);
        return ofGoogle(userNameAttributeName, attributes);
    }

    private static OAuthAttributes ofNaver(String userNameAttributeName, Map<String, Object> attributes) {
        Map<String, Object> response = (Map<String, Object>) attributes.get("response");

        return OAuthAttributes.builder()
              .name((String) response.get("nickname"))
              .email((String) response.get("email"))
              .picture((String) response.get("profile_image"))
              .attributes(response)
              .nameAttributeKey(userNameAttributeName)
              .build();
    }

    private static OAuthAttributes ofKakao(String userNameAttributeName, Map<String, Object> attributes) {
        Map<String, Object> response = (Map<String, Object>) attributes.get("response");

        return OAuthAttributes.builder()
              .name((String) response.get("profile_nickname"))
              .email((String) response.get("account_email"))
              .picture((String) response.get("profile_image"))
              .attributes(response)
              .nameAttributeKey(userNameAttributeName)
              .build();
    }

    private static OAuthAttributes ofGoogle(String userNAmeAttributeName, Map<String, Object> attributes) {
        return OAuthAttributes.builder()
              .name((String) attributes.get("name"))
              .email((String) attributes.get("email"))
              .picture((String) attributes.get("picture"))
              .attributes(attributes)
              .nameAttributeKey(userNAmeAttributeName)
              .build();
    }

    public MemberVO toEntity() {
        MemberVO member = new MemberVO();
        member.setId(email);
        member.setNickname(name);
        member.setSname(picture);
        member.setRole(Auth.R01.getKey());
        member.setMileage(0);
        return member;
    }
}
