package com.munhwa.prj.artist.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
@ToString
@Getter
@Setter
public class ArtistVO {
	private int id;
	private String image;
	private String gender;
	private String genre;
	private String content;	
	private String type;
	private String memberId;
	private String name;
	
	public ArtistVO() {}
	
	public ArtistVO(String gender, String genre, String content, String type, String memberId,
			String name) {
		this.gender = gender;
		this.genre = genre;
		this.content = content;
		this.type = type;
		this.memberId = memberId;
		this.name = name;
	}
	
}