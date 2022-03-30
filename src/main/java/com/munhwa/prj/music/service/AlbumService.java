package com.munhwa.prj.music.service;

import java.util.List;

import com.munhwa.prj.music.vo.AlbumVO;

public interface AlbumService {
	List<AlbumVO> albumSelectList();
	List<AlbumVO> albumSelectListByRelease();
	
	AlbumVO albumSelect(int id);
	AlbumVO albumSelectByMusicId(int id);

	int albumInsert(AlbumVO vo);
	int albumUpdate(AlbumVO vo);
	int albumDelete(AlbumVO vo);
}
