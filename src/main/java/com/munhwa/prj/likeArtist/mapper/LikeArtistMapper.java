package com.munhwa.prj.likeArtist.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.munhwa.prj.likeArtist.vo.LikeArtistVO;

public interface LikeArtistMapper {
	
	// 좋아요 한 아티스트 리스트
	List<LikeArtistVO> likeArtistList(@Param("id") String memberId);
	
	// 좋아요 한 아티스트 삭제
	int deleteLikeArtist(LikeArtistVO vo);

	List<String> selectMemberListByArtistId(int artistId);
}
