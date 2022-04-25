package com.munhwa.prj.wishlist.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.munhwa.prj.wishlist.vo.WishlistMusicVO;
import com.munhwa.prj.wishlist.vo.WishlistVO;

public interface WishlistMapper {
	
	// 위시리스트 리스트
	List<WishlistVO> wishlistList(String memberId);

	// 위시리스트 곡 리스트
	List<WishlistVO> wishlistMusicList(@Param("memberId") String memberId, @Param("wishlistId") String wishlistId);

	//위시리스트 생성
	int createWishList(WishlistVO vo);

	int insertWishlist(@Param("musicId") int musicId, @Param("wishId") int wishId);

	// 앨범 전체 위시리스트 추가 
	int insertWishlist2(Map<String, Integer> param);

	// 위시리스트 삭제
	int deleteWishlist(WishlistVO vo);
	
	// 위시리스트 곡 삭제
	int deleteWishlistMusic(@Param("musicId") int musicId, @Param("wishId") int wishId);

	// 마이페이지 - 위시리스트 추가
	int addWishlist(WishlistVO vo);

	//위시리스트 생성
	int createWishList(Map<String, Object> paramMap);
	
	// 위시리스트 곡 순서변경
	int updateMusicOrders(Map<String, Object> vo);
}
