package com.munhwa.prj.cart.web;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
	
	// 카트 세션 테스트
	@GetMapping("/cart/test")
	@ResponseBody
	public String cart(HttpServletRequest req) {
		Map<Integer, MusicVO> map = new HashMap<Integer, MusicVO>();
		req.getSession().setAttribute("cart", map);
		return "OK";
	}

	@RequestMapping("/cart")
	public String listCart(Model model, HttpServletRequest req) {
		@SuppressWarnings("unchecked")
		Map<Integer, MusicVO> map = (Map<Integer, MusicVO>) req.getSession().getAttribute("cart");
		model.addAttribute("carts", map);
		return "cart/shop_cart";

//	      model.addAttribute("carts", cartDao.listCart());
//	      return "cart/shop_cart";

	}

	@GetMapping("/cart/test/add")
	@ResponseBody
	public String addCart(MusicVO vo, HttpServletRequest req) {
		@SuppressWarnings("unchecked")
		Map<Integer, MusicVO> map = (Map<Integer, MusicVO>) req.getSession().getAttribute("cart");
		map.put(vo.getId(), vo);
		req.getSession().setAttribute("cart", map);
		return "success";
	}

	@PostMapping("/deleteCart")
	@ResponseBody
	public String deleteCart(CartVO vo) {
		int r = cartDao.deleteCart(vo);
		if (r != 0) {
			return "Success";
		} else {
			return null;
		}
	}

}
