package com.munhwa.prj.wishlist.serviceImpl;

import com.munhwa.prj.wishlist.mapper.WishlistMapper;
import com.munhwa.prj.wishlist.service.WishlistService;
import com.munhwa.prj.wishlist.vo.WishlistVO;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class WishlistServiceImpl implements WishlistService {

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
    public int deleteWishlist(WishlistVO vo) {
        return map.deleteWishlist(vo);
    }

    @Override
    public int insertWishlist(int musicId, int wishId) {
        return map.insertWishlist(musicId, wishId);
    }

    @Override
    public int insertWishlist2(Map<String, Integer> param) {
        return map.insertWishlist2(param);
    }

    @Override
    public int deleteWishlistMusic(int musicId, int wishId) {
        return map.deleteWishlistMusic(musicId, wishId);
    }

    @Override
    public int createWishList(Map<String, Object> paramMap) {
        return map.createWishList(paramMap);
    }

    @Override
    public int addWishlist(WishlistVO vo) {
        return map.addWishlist(vo);
    }

	@Override
	public int updateMusicOrders(Map<String, Object> vo) {
		return map.updateMusicOrders(vo);
	}
}
