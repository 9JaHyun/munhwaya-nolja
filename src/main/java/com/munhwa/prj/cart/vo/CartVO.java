package com.munhwa.prj.cart.vo;

import com.munhwa.prj.music.vo.MusicVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CartVO {
	private int id;
	private String memberId;
	private int musicId; 
	
	private MusicVO musicvo;
}
