package com.munhwa.prj.music.vo;

import lombok.Getter;
import lombok.Setter;

@Getter  @Setter
public class SearchVO {
	
	// musicVO 정보
	private int musicId;
	private String musicTitle;
	private String musicArtistName;
	private String musicMp3;
	private String musicImage;
	
	// albumVO 정보
	private int albumId;
	private String albumTitle;
	private String albumArtistName;
	private String albumImage;
}
