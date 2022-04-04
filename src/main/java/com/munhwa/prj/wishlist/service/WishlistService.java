package com.munhwa.prj.wishlist.service;

import java.util.List;

import com.munhwa.prj.wishlist.vo.WishlistVO;

public interface WishlistService {
	
	
	// 위시리스트 리스트
	List<WishlistVO> wishlistList(String memberId);
	
	// 위시리스트 곡 리스트
	List<WishlistVO> wishlistMusicList(String memberId, String wishlistId);
	
	public int insertWishlist(int musicId, int wishId);
}
