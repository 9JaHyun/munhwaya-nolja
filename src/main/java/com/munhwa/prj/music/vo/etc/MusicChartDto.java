package com.munhwa.prj.music.vo.etc;

import com.munhwa.prj.music.vo.MusicVO;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
public class MusicChartDto {
	
	private int id;
	private String artName;
	private int downloadCnt;
	private String picture;
	private String title;
	private String genre;
	private int albumId;

	private int artId;
	private boolean purchase;
	
	public MusicChartDto(MusicVO musicVO) {
		this.id = musicVO.getId();
		this.artName = musicVO.getArtName();
		this.downloadCnt = musicVO.getDownloadCnt();
		this.picture = musicVO.getPicture();
		this.title = musicVO.getTitle();
		this.genre = musicVO.getGenre();
		this.albumId = musicVO.getAlbumId();
		this.purchase = false;
	}
}
