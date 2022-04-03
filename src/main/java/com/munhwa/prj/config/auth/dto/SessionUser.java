package com.munhwa.prj.config.auth.dto;

import com.munhwa.prj.member.vo.MemberVO;
import java.io.Serializable;
import lombok.Getter;

// 도메인 엔티티는 항상 순수해야하기 때문에, 직렬화를 구현한 SessionUser을 따로 생성
@Getter
public class SessionUser implements Serializable {
    private String name;
    private String email;
    private String picture;

    public SessionUser(MemberVO member) {
        this.name = member.getNickname();
        this.email = member.getId();
        this.picture = member.getImage();
    }
}
