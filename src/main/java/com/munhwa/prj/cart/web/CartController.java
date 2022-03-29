package com.munhwa.prj.cart.web;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.munhwa.prj.cart.service.CartService;
import com.munhwa.prj.cart.vo.CartVO;
import com.munhwa.prj.music.vo.MusicVO;

@Controller
public class CartController {
	
	@Autowired
	private CartService cartDao;
	
//	@GetMapping("/shop/cart")
//	public String selectCart(CartVO vo, Model model) {
//		model.addAttribute("cart", cartDao.selectCart(vo));
//		return "shop/shop_cart";
//	}
	
	@RequestMapping("/cart")
	public String listCart(Model model, HttpServletRequest req) {
		@SuppressWarnings("unchecked")
		Map<Integer, MusicVO> map = (Map<Integer, MusicVO>) req.getSession().getAttribute("cart");
		model.addAttribute("carts", map);
		return "cart/shop_cart";
		
//		model.addAttribute("carts", cartDao.listCart());
//		return "cart/shop_cart";
		
	}
	
	@PostMapping("/deleteCart")
	@ResponseBody
	public String deleteCart(MusicVO vo, HttpServletRequest req) {
		@SuppressWarnings("unchecked")
		Map<Integer, MusicVO> map = (Map<Integer, MusicVO>) req.getSession().getAttribute("cart");
		map.remove((Integer) vo.getId());
		return "ok";
//		int r = cartDao.deleteCart(vo);
//		if (r != 0 ) {
//			return "Success";
//		} else {
//		return null;
		}
	}
	
//	List<MusicVO> cart = new ArrayList<>();
//	login할때 
//	session.addAttribte("cart", cart);
//	
//	//장바구니 넣기
//	(Map<Integer, MusicVO>) session.getAttribute("cart").add(vo);
//	
//	(List<MusicVO>) session.getAttribute("cart") 음악 리스트
//	map.delete(musicVO_Id)
	
//}
