package com.munhwa.prj.artist.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.munhwa.prj.artist.vo.ArtDetailVO;
import com.munhwa.prj.artist.vo.ArtDetailVO2;
import com.munhwa.prj.artist.vo.ArtistVO;
import com.munhwa.prj.common.paging.entity.Criteria;

public interface ArtistMapper {

    List<ArtistVO> selectArtistList();
    List<ArtDetailVO> findMusic(@Param("cri") Criteria cri, @Param("id") int artistId);
//    List<ArtDetailVO2> musicListPage(@Param("cri") Criteria cri, @Param("artistId")int id);
    ArtistVO selectArtistByMemberId(String memberId);
	int checkBuy(@Param("id") String id, @Param("musicId") int musicId);
    int insertArtist(ArtistVO vo);
    int updateArtist(ArtistVO vo);
    int musicCnt(int vo);
    int albumCnt(int vo);
	int getTotal(@Param("cri") Criteria cri, @Param("artistId") int id);
    
    
    int chkName(String name);
}
