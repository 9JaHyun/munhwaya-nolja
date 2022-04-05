package com.munhwa.prj.member.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MemberVO {
	
	private String id;
	private String password;
	private String nickname;
	private String tel;
	private String genre;
	private String role;
	private int mileage;
	private String image;

	public MemberVO update(String nickname, String image) {
		this.nickname = nickname;
		this.image = image;
		return this;
	}
}
