package com.munhwa.prj.config.auth.dto;

import com.munhwa.prj.music.vo.MusicVO;
import com.munhwa.prj.common.code.Genre;
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
    private String id;
    private String nickname;
    private String sname;
    private String oname;
    private String tel;
    private String password;
    private Genre genre;
    private int mileage;
    private Map<Integer, MusicVO> cart;
    private Auth role;

    public SessionUser(MemberVO member) {
        this.id = member.getId();
        this.nickname = member.getNickname();
        this.sname = member.getSname();
        this.oname = member.getOname();
        this.mileage = member.getMileage();
        this.tel = member.getTel();
        this.password = member.getPassword();
        this.genre = Genre.valueOf(member.getGenre());
        this.cart = new HashMap<>();
        this.role = Auth.valueOf(member.getRole());
    }

}
