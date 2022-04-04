package com.munhwa.prj.wishlist.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.munhwa.prj.wishlist.vo.WishlistVO;

public interface WishlistMapper {
	
	// 위시리스트 리스트
	List<WishlistVO> wishlistList(String memberId);
	
	// 위시리스트 곡 리스트
	List<WishlistVO> wishlistMusicList(@Param("memberId") String memberId, @Param("wishlistId") String wishlistId);
	
	public int insertWishlist(@Param("musicId") int musicId, @Param("wishId") int wishId);
}
