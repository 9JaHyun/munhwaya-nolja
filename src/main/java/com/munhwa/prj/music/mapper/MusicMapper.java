package com.munhwa.prj.music.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.munhwa.prj.music.vo.MusicVO;
import com.munhwa.prj.music.vo.SearchVO;

public interface MusicMapper {
		List<MusicVO> musicSelectList();
		List<MusicVO> musicSelectListByGenre(String genre);
		List<MusicVO> musicPersonalList(String id);
		List<SearchVO> musicSelectByTitle(String title);
		List<MusicVO> musicSelectByAlBum(int id);
		List<MusicVO> musicSelectListByPurchase(String id);
		List<MusicVO> musicSelectListByWishList(int id);
		
		MusicVO musicSelectByArtName(@Param("title") String title, @Param("artName") String artName);
		MusicVO musicSelect(int id);
		int musicIdByTitle(MusicVO vo);
		
		int updateLike(Map<String, Object> paramMap);
	
		int musicInsert(MusicVO vo);
		int musicUpdate(MusicVO vo);
		int musicDelete(MusicVO vo);
}
