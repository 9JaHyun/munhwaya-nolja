package com.munhwa.prj.music.service;

import java.util.List;

import com.munhwa.prj.music.vo.MusicVO;
import com.munhwa.prj.music.vo.SearchVO;

public interface MusicService {
	List<MusicVO> musicSelectList();
	List<MusicVO> musicSelectListByGenre(String genre);
	List<MusicVO> musicPersonalList(String id);
	List<SearchVO> musicSelectByTitle(String title);
	List<MusicVO> musicSelectByAlBum(int id);
	List<MusicVO> musicSelectListByPurchase(String id);
	List<MusicVO> musicSelectListByWishList(int id);
	
	MusicVO musicSelect(int id);
	int musicIdByTitle(MusicVO vo);
	int musicInsert(MusicVO vo);
	int musicUpdate(MusicVO vo);
	int musicDelete(MusicVO vo);
}
