package com.munhwa.prj.cart.service;

import java.util.List;

import com.munhwa.prj.cart.vo.CartVO;

public interface CartService {
	List<CartVO> listCart();
	CartVO selectCart(CartVO vo);
	int insertCart(CartVO vo);
	int deleteCart(CartVO vo);
}
