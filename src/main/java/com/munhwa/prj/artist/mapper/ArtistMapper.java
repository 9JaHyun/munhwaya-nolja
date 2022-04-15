package com.munhwa.prj.artist.mapper;

import java.util.List;

import com.munhwa.prj.artist.vo.ArtistVO;

public interface ArtistMapper {
	List<ArtistVO> artistSelectList();
	ArtistVO artistSelect(ArtistVO vo);
	int artistInsert(ArtistVO vo);
	int artistUpdate(ArtistVO vo);
	int nameChk(String name);
}
