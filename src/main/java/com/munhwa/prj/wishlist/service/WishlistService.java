package com.munhwa.prj.wishlist.service;

import java.util.List;

import com.munhwa.prj.wishlist.vo.WishlistVO;

public interface WishlistService {
	
	
	// 위시리스트 리스트
	List<WishlistVO> wishlistList(String memberId);
	
	// 위시리스트 삭제
	int deleteWishlist(WishlistVO vo);
	
	// 위시리스트 곡 리스트
	List<WishlistVO> wishlistMusicList(String memberId, String wishlistId);
	
	// 위시리스트 곡 삭제
	int deleteWishlistMusic(int musicId, int wishId);
	
	// 위시리스트 곡 추가
	public int insertWishlist(int musicId, int wishId);


}
