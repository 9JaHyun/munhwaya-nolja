package com.munhwa.prj.music.vo;

import java.util.Date;

import lombok.Data;

@Data
public class PurchaseVO {
	private int musicId;
	private String memberId;
	private Date createdAt;
	private Date updatedAt;
}
