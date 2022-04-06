package com.munhwa.prj.config.auth.dto;

import com.munhwa.prj.common.code.Genre;
import com.munhwa.prj.member.vo.Auth;
import com.munhwa.prj.member.vo.MemberVO;
import com.munhwa.prj.music.vo.MusicVO;
import java.io.Serializable;
import java.util.Map;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class SessionUser implements Serializable {

    private String id;
    private String nickname;
    private String image;
    private String tel;
    private Genre genre;
    private int mileage;
    private Map<Integer, MusicVO> cart;
    private Auth role;

    public SessionUser(MemberVO member) {
        this.id = member.getId();
        this.nickname = member.getNickname();
        this.image = member.getImage();
        this.mileage = member.getMileage();
        this.tel = member.getTel();
        this.genre = Genre.valueOf(member.getGenre());
        this.role = Auth.valueOf(member.getRole());
    }

}
