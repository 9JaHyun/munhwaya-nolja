package com.munhwa.prj.wishlist.service;

import com.munhwa.prj.wishlist.vo.WishlistVO;
import java.util.List;
import java.util.Map;

public interface WishlistService {

	// 위시리스트 리스트
	List<WishlistVO> wishlistList(String memberId);

	// 위시리스트 삭제
	int deleteWishlist(WishlistVO vo);

	// 위시리스트 곡 리스트
	List<WishlistVO> wishlistMusicList(String memberId, String wishlistId);
	
	// 위시리스트 곡 삭제
	int deleteWishlistMusic(int musicId, int wishId);
	
	// 위시리스트뮤직에 곡 추가
	int insertWishlist(int musicId, int wishId);

	int insertWishlist2(Map<String, Integer> param);

	//위시리스트 생성
	int createWishList(Map<String, Object> paramMap);

	// 마이페이지 - 위시리스트 추가
	int addWishlist(WishlistVO vo);
}
