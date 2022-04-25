package com.munhwa.prj.wishlist.vo;

import lombok.Data;

@Data
public class WishlistMusicVO {
	
	private int wishlistId;
	private int musicId;
	private String title;
	private int orders;
	private String artName;

}
