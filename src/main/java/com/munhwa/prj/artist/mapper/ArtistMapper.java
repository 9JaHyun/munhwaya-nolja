package com.munhwa.prj.artist.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.munhwa.prj.artist.vo.ArtDetailVO;
import com.munhwa.prj.artist.vo.ArtDetailVO2;
import com.munhwa.prj.artist.vo.ArtistVO;
import com.munhwa.prj.artist.vo.PromotionRequestVO;
import com.munhwa.prj.common.paging.entity.Criteria;
import com.munhwa.prj.music.vo.AlbumVO;

public interface ArtistMapper {
	
    List<ArtistVO> selectArtistList(); // 아티스트 상세페이지 전체 조회
    List<ArtDetailVO> findMusic(@Param("cri") Criteria cri, @Param("id") int artistId); // 아티스트 상세 곡 찾기
//    List<ArtDetailVO2> musicListPage(@Param("cri") Criteria cri, @Param("artistId")int id);
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

   // int chkName(String name);
}
