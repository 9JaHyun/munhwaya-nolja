package com.munhwa.prj.artist.service;

import java.util.List;

import com.munhwa.prj.artist.vo.ArtistVO;

public interface ArtistService {

	List<ArtistVO> findAll();
	ArtistVO findByMemberId(String memberId);
	int save(ArtistVO vo);
	int update(ArtistVO vo);
	int chkNick(String name);
}
