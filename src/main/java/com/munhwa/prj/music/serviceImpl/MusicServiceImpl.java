package com.munhwa.prj.music.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.munhwa.prj.common.vo.Criteria;
import com.munhwa.prj.music.mapper.MusicMapper;
import com.munhwa.prj.music.service.MusicService;
import com.munhwa.prj.music.vo.MusicVO;
import com.munhwa.prj.music.vo.SearchVO;

@Repository("musicDAO")
public class MusicServiceImpl implements MusicService{
	@Autowired
	private MusicMapper map;

	@Override
	public List<MusicVO> musicSelectList() {
		return map.musicSelectList();
	}

	@Override
	public List<MusicVO> musicSelectListByGenre(String genre) {
		return map.musicSelectListByGenre(genre);
	}
	
	@Override
	public List<MusicVO> musicPersonalList(String id, Criteria cri) {
		return map.musicPersonalList(id,cri);
	}
	
	@Override
	public List<SearchVO> musicSelectByTitle(String title) {
		return map.musicSelectByTitle(title);
	}
	
	@Override
	public List<MusicVO> musicSelectByAlBum(int id) {
		return map.musicSelectByAlBum(id);
	}
	
	@Override
	public List<MusicVO> musicSelectListByPurchase(String id) {
		return map.musicSelectListByPurchase(id);
	}
	
	@Override
	public List<MusicVO> musicSelectListByWishList(int id) {
		return map.musicSelectListByWishList(id);
	}
	
	@Override
	public MusicVO musicSelectByArtName(String title, String artName) {
		return map.musicSelectByArtName(title, artName);
	}
	
	@Override
	public MusicVO musicSelect(int id) {
		return map.musicSelect(id);
	}

	@Override
	public int musicIdByTitle(MusicVO vo) {
		return map.musicIdByTitle(vo);
	}

	@Override
	public int musicInsert(MusicVO vo) {
		return map.musicInsert(vo);
	}

	@Override
	public int musicUpdate(MusicVO vo) {
		return map.musicUpdate(vo);
	}
	
	@Override
	public int musicDelete(MusicVO vo) {
		return map.musicDelete(vo);
	}

	@Override
	public int updateLike(Map<String, Object> paramMap) {
		return map.updateLike(paramMap);
	}

	@Override
	public List<MusicVO> musicSelectListByMusicId(Map<String, List<Integer>> paramMap) {
		return map.musicSelectListByMusicId(paramMap);
	}

	@Override
	public int getCountByList(int id) {
		return map.getCountByList(id);
	}


}
