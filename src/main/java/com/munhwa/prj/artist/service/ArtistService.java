package com.munhwa.prj.artist.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.munhwa.prj.artist.vo.ArtDetailVO;
import com.munhwa.prj.artist.vo.ArtDetailVO2;
import com.munhwa.prj.artist.vo.ArtistVO;
import com.munhwa.prj.common.paging.entity.Criteria;

public interface ArtistService {

	List<ArtistVO> findAll();
	List<ArtDetailVO> findMusic(Criteria cri, int id);
//	List<ArtDetailVO2> musicListPage(Criteria cri);
	ArtistVO findByMemberId(String memberId);
    int artIdByAlbId(int albumId);
	int checkBuy(String id, int musicId);
	int save(ArtistVO vo);
	int update(ArtistVO vo);
	int musicCnt(int vo);
	int albumCnt(int vo);

	int getTotal(Criteria cri, int id);
	
	int chkNick(String name);
	
	
}
