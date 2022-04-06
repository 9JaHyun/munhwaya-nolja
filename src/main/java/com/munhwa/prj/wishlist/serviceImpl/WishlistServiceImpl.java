package com.munhwa.prj.wishlist.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.munhwa.prj.wishlist.mapper.WishlistMapper;
import com.munhwa.prj.wishlist.service.WishlistService;
import com.munhwa.prj.wishlist.vo.WishlistVO;

@Repository("wishlistDao")
public class WishlistServiceImpl implements WishlistService{
	
	@Autowired
	private WishlistMapper map;

	@Override
	public List<WishlistVO> wishlistList(String memberId) {
		return map.wishlistList(memberId);
	}


	@Override
	public List<WishlistVO> wishlistMusicList(String memberId, String wishlistId) {
		return map.wishlistMusicList(memberId, wishlistId);
	}


	@Override
	public int insertWishlist(int musicId, int wishId) {
		return map.insertWishlist(musicId, wishId);
	}


	@Override
	public int insertWishlist2(Map<String, Integer> param) {
		return map.insertWishlist2(param);
	}



}
