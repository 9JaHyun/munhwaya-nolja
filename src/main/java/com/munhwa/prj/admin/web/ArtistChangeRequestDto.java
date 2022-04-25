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
	private MultipartFile image; //jsp에서 수정해서 보내주는 파일자체
	
	public ArtistVO toEntity() {
		return new ArtistVO(gender, genre, content, type, memberId, name);
	}
}
