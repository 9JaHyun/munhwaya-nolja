package com.munhwa.prj.music.service;

import java.util.List;


import com.munhwa.prj.common.paging.entity.Criteria;
import com.munhwa.prj.music.vo.AlbumVO;

public interface AlbumService {
	
	List<AlbumVO> albumSelectList();
	
	List<AlbumVO> albumSelectListByRelease(Criteria cri);
	
	List<AlbumVO> albumSelectListByWishList(int id);
	
	List<AlbumVO> albumSelectByTitle(String title, Criteria cri);

	AlbumVO albumSelect(int id);
	
	AlbumVO albumSelectByMusicId(int id);
	
	AlbumVO albumSelectByWishList(int id);

	int albumInsert(AlbumVO vo);
	
	int albumUpdate(AlbumVO vo);
	
	int albumDelete(AlbumVO vo);
	
	int getCountByList(int id);
	
	int getCountByList4(String title);
	
	List<AlbumVO> albumSelectListByMemberId(String memberId);
	
	String albumPicture(String memberId, int id);
}
