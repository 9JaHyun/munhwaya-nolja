package com.munhwa.prj.likeArtist.service;

import java.util.List;

import com.munhwa.prj.likeArtist.vo.LikeArtistVO;

public interface LikeArtistService {

	int follow(LikeArtistVO vo);

	// 좋아요 한 아티스트 리스트
	List<LikeArtistVO> likeArtistList(String memberId);
	
	// 좋아요 한 아티스트 삭제
	int deleteLikeArtist(LikeArtistVO vo);

	List<String> searchFollowers(int artistId);
}
