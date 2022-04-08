package com.munhwa.prj.music.web.dto;

import com.munhwa.prj.music.vo.MusicVO;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
public class MusicChartDto {
	private int id;
	private String artName;
	private int likeIt;
	// 차트에서 바로 음원 다운로드
	private String fileName;
	private String title;
	private boolean purchase;
	
	public MusicChartDto(MusicVO musicVO) {
		this.id = musicVO.getId();
		this.artName = musicVO.getArtName();
		this.likeIt = musicVO.getLikeIt();
		this.title = musicVO.getTitle();
		this.purchase = false;
	}
}
