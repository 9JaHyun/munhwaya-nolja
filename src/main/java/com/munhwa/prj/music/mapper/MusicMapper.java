package com.munhwa.prj.music.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.munhwa.prj.common.paging.entity.Criteria;
import com.munhwa.prj.music.vo.MusicVO;

public interface MusicMapper {
		List<MusicVO> musicSelectList(@Param("cri")Criteria cri);
  
		List<MusicVO> musicSelectListByGenre(String genre);
  
		List<MusicVO> musicPersonalList(@Param("id") String id, @Param("cri")Criteria cri);
  
		List<MusicVO> musicSelectByTitle(@Param("title") String title, @Param("cri")Criteria cri);
  
		List<MusicVO> musicSelectByAlBum(int id);
  
		List<MusicVO> musicSelectListByPurchase(@Param("id") String id, @Param("cri") Criteria cri);
  
		List<MusicVO> musicSelectListByWishList(int id);
  
		List<MusicVO> musicSelectListByMusicId(Map<String, List<Integer>> paramMap);
  
		MusicVO musicSelectByArtName(@Param("title") String title, @Param("artName") String artName);
  
		MusicVO musicSelect(int id);
  
		int musicIdByTitle(MusicVO vo);
  
		int statusUpdate(Map<String, Object> paramMap);
  
		int musicInsert(MusicVO vo);
  
		int musicUpdate(MusicVO vo);
  
		int musicDelete(MusicVO vo);
		
		int getCountByList(String id);
		
		int getCountByList2(String id);
		
		int getCountByList3(String title);

}
