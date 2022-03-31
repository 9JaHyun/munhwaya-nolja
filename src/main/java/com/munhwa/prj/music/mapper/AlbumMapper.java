package com.munhwa.prj.music.mapper;

import java.util.List;

import com.munhwa.prj.music.vo.AlbumVO;

public interface AlbumMapper {
	List<AlbumVO> albumSelectList();
	List<AlbumVO> albumSelectListByRelease();
	List<AlbumVO> albumSelectListByWishList(int id);
	
	AlbumVO albumSelect(int id);
	AlbumVO albumSelectByMusicId(int id);
	AlbumVO albumSelectByWishList(int id);
	
	int albumInsert(AlbumVO vo);
	int albumUpdate(AlbumVO vo);
	int albumDelete(AlbumVO vo);
}
