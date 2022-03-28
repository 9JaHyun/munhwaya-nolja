package com.munhwa.prj.cart.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.munhwa.prj.cart.service.CartService;
import com.munhwa.prj.cart.vo.CartVO;

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
	public String listCart(Model model) {
		model.addAttribute("carts", cartDao.listCart());
		return "shop/shop_cart";
	}
	
	@PostMapping("/deleteCart")
	@ResponseBody
	public String deleteCart(CartVO vo) {
		int r = cartDao.deleteCart(vo);
		if (r != 0 ) {
			return "Success";
		} else {
		return null;
		}
	}
		
}
