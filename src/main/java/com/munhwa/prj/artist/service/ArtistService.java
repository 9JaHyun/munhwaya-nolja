package com.munhwa.prj.artist.service;

import com.munhwa.prj.artist.vo.ArtDetailVO;
import com.munhwa.prj.artist.vo.ArtDetailVO2;
import com.munhwa.prj.artist.vo.ArtistVO;
import com.munhwa.prj.common.paging.entity.Criteria;
import java.util.List;

public interface ArtistService {

    List<ArtistVO> selectArtistList();

    List<ArtDetailVO> findMusic(Criteria cri, int artistId);

    ArtistVO findByMemberId(String id);

    ArtistVO findByArtistId(int artId);

    List<ArtDetailVO2> albumInfo(Criteria cri, int artistId);

    int checkBuy(String id, int musicId);

    int insertArtist(ArtistVO vo);

    int updateArtist(ArtistVO vo);

    int musicCnt(int vo);

    int albumCnt(int vo);

	int getTotal(Criteria cri, int id);
	
	int getTotal2(Criteria cri, int artistId);
	
	int artIdByAlbId(int albumId);
}