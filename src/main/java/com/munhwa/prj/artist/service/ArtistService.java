package com.munhwa.prj.artist.service;

import com.munhwa.prj.artist.vo.ArtDetailVO;
import com.munhwa.prj.artist.vo.ArtDetailVO2;
import com.munhwa.prj.artist.vo.ArtistVO;
import com.munhwa.prj.common.paging.entity.Criteria;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ArtistService {

    List<ArtistVO> selectArtistList();

    List<ArtDetailVO> findMusic(@Param("cri") Criteria cri, @Param("id") int artistId);

    ArtistVO findByMemberId(String id);

    ArtistVO findByArtistId(int artId);

    List<ArtDetailVO2> albumInfo(@Param("cri") Criteria cri, @Param("artistId") int artistId);

    int checkBuy(@Param("id") String id, @Param("musicId") int musicId);

    int insertArtist(ArtistVO vo);

    int updateArtist(ArtistVO vo);

    int musicCnt(int vo);

    int albumCnt(int vo);
	int getTotal(@Param("cri") Criteria cri, @Param("artistId") int id);
	int getTotal2(@Param("cri") Criteria cri, @Param("artistId") int artistId);
	int artIdByAlbId(int albumId);
   // int chkName(String name);;
}

    int getTotal(Criteria cri, int id);

    int getTotal2(Criteria cri, int artistId);

    String getStatus(String memberId);

    int artIdByAlbId(int albumId);
    
	String artistOfName(String memberId);
	int artistOfId(String memberId);
}