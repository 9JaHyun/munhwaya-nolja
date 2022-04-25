package com.munhwa.prj.music.vo;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import com.munhwa.prj.artist.vo.ArtistVO;

import lombok.Data;

@Data
public class AlbumVO {
	private int id;
	private String albName;
	private String artName;
	
	@DateTimeFormat(iso = ISO.DATE)
	private Date releaseAt;
	
	private String genre;
	private String content;
	private String picture;
	private int artistId;
	private int score;
	private int hit;
	
}
