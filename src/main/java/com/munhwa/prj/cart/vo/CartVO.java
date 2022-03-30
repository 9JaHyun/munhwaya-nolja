package com.munhwa.prj.cart.vo;

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
