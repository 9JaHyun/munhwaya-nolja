package com.munhwa.prj.cart.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.munhwa.prj.cart.mapper.CartMapper;
import com.munhwa.prj.cart.service.CartService;
import com.munhwa.prj.cart.vo.CartVO;
@Repository("cartDao")
public class CartServiceImpl implements CartService {

	@Autowired
	private CartMapper map;

	@Override
	public List<CartVO> listCart() {
		return map.listCart();
	}

	@Override
	public CartVO selectCart(CartVO vo) {
		return map.selectCart(vo);
	}

	@Override
	public int insertCart(CartVO vo) {
		return map.insertCart(vo);
	}

	@Override
	public int deleteCart(CartVO vo) {
		return map.deleteCart(vo);
	}

}
