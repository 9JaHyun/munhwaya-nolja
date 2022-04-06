package com.munhwa.prj.music.mapper;

import java.util.List;

import com.munhwa.prj.music.vo.MusicVO;

public interface MusicMapper {
		List<MusicVO> musicSelectList();
		MusicVO musicSelect(int id);
		int musicInsert(MusicVO vo);
		int musicUpdate(MusicVO vo);
		int musicDelete(MusicVO vo);
}
