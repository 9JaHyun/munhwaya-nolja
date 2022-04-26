package com.munhwa.prj.likeArtist.mapper;

import com.munhwa.prj.likeArtist.vo.LikeArtistVO;
import java.util.List;

public interface LikeArtistMapper {

	int insertLikeArtist(LikeArtistVO vo);

	// 좋아요 한 아티스트 리스트
	List<LikeArtistVO> likeArtistList(String memberId);
	
	// 좋아요 한 아티스트 삭제
	int deleteLikeArtist(LikeArtistVO vo);

	List<String> selectMemberListByArtistId(int artistId);
}
