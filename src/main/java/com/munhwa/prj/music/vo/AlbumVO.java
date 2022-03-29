package com.munhwa.prj.music.vo;

import java.util.Date;

import lombok.Data;

@Data
public class AlbumVO {
	private int id;
	private String albName;
	private String artName;
	private Date releaseAt;
	private String genre;
	private String content;
	private String picture;
	private int artistId;
	private int score;
	private int hit;
}
