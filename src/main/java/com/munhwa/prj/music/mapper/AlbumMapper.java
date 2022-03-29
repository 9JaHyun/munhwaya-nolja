package com.munhwa.prj.music.mapper;

import java.util.List;

import com.munhwa.prj.music.vo.AlbumVO;

public interface AlbumMapper {
	List<AlbumVO> albumSelectList();
	AlbumVO albumSelect(AlbumVO vo);
	int albumInsert(AlbumVO vo);
	int albumUpdate(AlbumVO vo);
	int albumDelete(AlbumVO vo);
}