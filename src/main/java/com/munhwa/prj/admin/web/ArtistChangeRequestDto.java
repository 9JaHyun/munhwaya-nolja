package com.munhwa.prj.admin.web;

import org.springframework.web.multipart.MultipartFile;

import com.munhwa.prj.artist.vo.ArtistVO;

import lombok.Data;

@Data
public class ArtistChangeRequestDto {
	private String gender;
	private String genre;
	private String content;	
	private String type;
	private String memberId;
	private String name;
	private MultipartFile image;
	
	public ArtistVO toEntity() {
		return new ArtistVO(gender, genre, content, type, memberId, name);
	}
}
