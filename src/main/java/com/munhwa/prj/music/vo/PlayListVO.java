package com.munhwa.prj.music.vo;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Builder
@Getter @Setter
public class PlayListVO {
	private String mp3;
	private String title;
	private String artist;
	private String rating;
	private String buy;
	private String price;
	private String duration;
	private String cover;
}
