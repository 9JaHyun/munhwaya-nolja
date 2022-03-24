package com.munhwa.prj.music.vo;

import java.util.Date;

import lombok.Data;

@Data
public class AlbumVO {
	private int id;
	private String albName;
	private String artName;
	private Date date;
	private String genre;
	private String content;
	private String picture;
	private int artId;
	private int score;
	private int hit;
}
