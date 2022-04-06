package com.munhwa.prj.music.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	public List<MusicVO> musicPersonalList(String id) {
		return map.musicPersonalList(id);
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

}
