package com.munhwa.prj.music.vo.etc;

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
	private String picture;
	private String title;
	private boolean purchase;
	
	public MusicChartDto(MusicVO musicVO) {
		this.id = musicVO.getId();
		this.artName = musicVO.getArtName();
		this.likeIt = musicVO.getLikeIt();
		this.picture = musicVO.getPicture();
		this.title = musicVO.getTitle();
		this.purchase = false;
	}
}
