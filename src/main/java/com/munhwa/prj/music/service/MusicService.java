package com.munhwa.prj.music.service;

import java.util.List;
import java.util.Map;

import com.munhwa.prj.common.vo.Criteria;
import com.munhwa.prj.music.vo.MusicVO;

public interface MusicService {
	List<MusicVO> musicSelectList();
	
	List<MusicVO> musicSelectListByGenre(String genre);
	
	List<MusicVO> musicPersonalList(String id, Criteria cri);
	
	List<MusicVO> musicSelectByTitle(String title,Criteria cri);
	
	List<MusicVO> musicSelectByAlBum(int id);
	
	List<MusicVO> musicSelectListByPurchase(String id, Criteria cri);
	
	List<MusicVO> musicSelectListByWishList(int id);
	
	List<MusicVO> musicSelectListByMusicId(Map<String, List<Integer>> paramMap);

	
	MusicVO musicSelectByArtName(String title, String artName);
	
	MusicVO musicSelect(int id);
	
	int musicIdByTitle(MusicVO vo);
	
	int updateLike(Map<String, Object> paramMap);
	
	int musicInsert(MusicVO vo);
	
	int musicUpdate(MusicVO vo);
	
	int musicDelete(MusicVO vo);
	
	int getCountByList(String id);
	
	int getCountByList2(String id);
	
	int getCountByList3(String title);
	
}
