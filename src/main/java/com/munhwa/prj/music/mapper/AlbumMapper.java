package com.munhwa.prj.music.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.munhwa.prj.common.entity.Criteria;
import com.munhwa.prj.music.vo.AlbumVO;

public interface AlbumMapper {
	List<AlbumVO> albumSelectList();
	
	List<AlbumVO> albumSelectListByRelease(@Param("cri") Criteria cri);
	
	List<AlbumVO> albumSelectByTitle(@Param("title") String title, @Param("cri")Criteria cri);

	List<AlbumVO> albumSelectListByWishList(int id);
	
	AlbumVO albumSelect(int id);
	
	AlbumVO albumSelectByMusicId(int id);
	
	AlbumVO albumSelectByWishList(int id);
	
	int albumInsert(AlbumVO vo);
	
	int albumUpdate(AlbumVO vo);
	
	int albumDelete(AlbumVO vo);
	
	int getCountByList(int id);
	
	int getCountByList4(String title);
}
