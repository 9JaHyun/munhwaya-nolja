package com.munhwa.prj.artist.service;

import java.util.List;

import com.munhwa.prj.artist.vo.ArtistVO;

public interface ArtistService {

	List<ArtistVO> artistSelectList();
	ArtistVO artistSelect(ArtistVO vo);
	int artistInsert(ArtistVO vo);
	int artistUpdate(ArtistVO vo);
	int nameChk(String name);

}
