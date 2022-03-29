package com.munhwa.prj.music.service;

import java.util.List;

import com.munhwa.prj.music.vo.MusicVO;

public interface MusicService {
	List<MusicVO> musicSelectList();
	MusicVO musicSelect(MusicVO vo);
	int musicInsert(MusicVO vo);
	int musicUpdate(MusicVO vo);
	int musicDelete(MusicVO vo);
}
