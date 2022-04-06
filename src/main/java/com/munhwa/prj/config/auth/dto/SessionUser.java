package com.munhwa.prj.config.auth.dto;

import com.munhwa.prj.cart.vo.MusicVO;
import com.munhwa.prj.member.vo.Auth;
import com.munhwa.prj.member.vo.MemberVO;
import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;
import lombok.Data;
import lombok.NoArgsConstructor;

// 도메인 엔티티는 항상 순수해야하기 때문에, 직렬화를 구현한 SessionUser을 따로 생성
@NoArgsConstructor
@Data
public class SessionUser implements Serializable {

    private String email;
    private String name;
    private String picture;
    private Map<Integer, MusicVO> cart;
    private Auth role;

    public SessionUser(MemberVO member) {
        this.email = member.getId();
        this.name = member.getNickname();
        this.picture = member.getImage();
        this.cart = new HashMap<>();
        this.role = Auth.valueOf(member.getRole());
    }

}
