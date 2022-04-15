package com.munhwa.prj.music.vo;

import java.util.Date;

import lombok.Data;

@Data
public class PurchaseVO2 {
	private String picture;
	private String title;
	private String artName;
	private Date createdAt;
	private int fileId;
	private int price;
}
