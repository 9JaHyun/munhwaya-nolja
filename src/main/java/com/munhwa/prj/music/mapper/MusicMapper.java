package com.munhwa.prj.music.mapper;

import java.util.List;

import com.munhwa.prj.music.vo.MusicVO;

public interface MusicMapper {
		List<MusicVO> musicSelectList();
		List<MusicVO> musicSelectListByGenre(String genre);
		List<MusicVO> musicPersonalList(String id);
		List<MusicVO> musicSelectByTitle(String title);

		MusicVO musicSelect(MusicVO vo);
		int musicInsert(MusicVO vo);
		int musicUpdate(MusicVO vo);
		int musicDelete(MusicVO vo);
}
