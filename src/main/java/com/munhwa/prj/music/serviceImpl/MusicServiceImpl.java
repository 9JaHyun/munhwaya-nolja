package com.munhwa.prj.music.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.munhwa.prj.common.entity.Criteria;
import com.munhwa.prj.music.mapper.MusicMapper;
import com.munhwa.prj.music.service.MusicService;
import com.munhwa.prj.music.vo.MusicVO;

@Repository("musicDAO")
public class MusicServiceImpl implements MusicService{
	@Autowired
	private MusicMapper map;

	@Override
	public List<MusicVO> musicSelectList(Criteria cri) {
		return map.musicSelectList(cri);
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
	public List<MusicVO> musicSelectByTitle(String title, Criteria cri) {
		return map.musicSelectByTitle(title, cri);
	}
	
	@Override
	public List<MusicVO> musicSelectByAlBum(int id) {
		return map.musicSelectByAlBum(id);
	}
	
	@Override
	public List<MusicVO> musicSelectListByPurchase(String id, Criteria cri) {
		return map.musicSelectListByPurchase(id,cri);
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
	public List<MusicVO> musicSelectListByMusicId(Map<String, List<Integer>> paramMap) {
		return map.musicSelectListByMusicId(paramMap);
	}

	@Override
	public int getCountByList(String id) {
		return map.getCountByList(id);
	}

	@Override
	public int getCountByList2(String id) {
		return map.getCountByList2(id);
	}

	@Override
	public int getCountByList3(String title) {
		return map.getCountByList3(title);
	}

	@Override
	public int statusUpdate(Map<String, Object> paramMap) {
		return map.statusUpdate(paramMap);
	}


}
