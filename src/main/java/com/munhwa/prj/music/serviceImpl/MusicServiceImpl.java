package com.munhwa.prj.music.serviceImpl;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.munhwa.prj.music.mapper.MusicMapper;
import com.munhwa.prj.music.service.MusicService;
import com.munhwa.prj.music.vo.MusicVO;

@Repository("musicDAO")
public class MusicServiceImpl implements MusicService{
	@Autowired
	private MusicMapper map;

	@Override
	public List<MusicVO> musicSelectList() {
		return map.musicSelectList();
	}

	@Override
	public MusicVO musicSelect(MusicVO vo) {
		return map.musicSelect(vo);
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
	public List<MusicVO> musicSelectListByGenre(String genre) {
		return map.musicSelectListByGenre(genre);
	}

	@Override
	public List<MusicVO> musicPersonalList(String id) {
		return map.musicPersonalList(id);
	}
	

}
