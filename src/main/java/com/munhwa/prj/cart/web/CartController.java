package com.munhwa.prj.cart.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.munhwa.prj.config.auth.LoginUser;
import com.munhwa.prj.config.auth.entity.SessionUser;
import com.munhwa.prj.music.service.MusicService;
import com.munhwa.prj.music.vo.MusicVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class CartController {
	@Autowired
	private MusicService musicDAO;

	//	@GetMapping("/shop/cart")
	@RequestMapping("/cart")
	public String listCart(@LoginUser SessionUser user,  Model model) {
		Map<Integer, MusicVO> cart = user.getCart();
		model.addAttribute("carts", cart);
		model.addAttribute("mileage", user.getMileage());
		return "cart/shop_cart";
	}

	@RequestMapping(value = "/cart/add", produces = "application/text; charset=UTF-8")
	public ResponseEntity<String> addCart(@LoginUser SessionUser user, @RequestParam List<Integer> id) {
		Map<String, List<Integer>> paramMap = new HashMap<>();
		paramMap.put("musicIdList", id);

		List<MusicVO> list = musicDAO.musicSelectListByMusicId(paramMap);

		Map<Integer, MusicVO> cart = user.getCart();
		int count = 0;
		for (MusicVO vo : list) {
			if (cart.containsKey(vo.getId())) {
				++count;
			}
			cart.put(vo.getId(), vo);
		}
		user.setCart(cart);
		String msg;
		int result = list.size() - count;
		if(result == list.size()) {
			msg = String.format("%d개의 곡을 장바구니에 넣었습니다.", result); 
		} else {
			msg = String.format("이미 존재하는 곡을 제외한 %d개의 곡을 장바구니에 넣었습니다.", result); 
		}
		return ResponseEntity.ok().body(msg);
	}
  
	@PostMapping("/deleteCart")
	@ResponseBody
	public String deleteCart(@LoginUser SessionUser user, MusicVO vo) {
		Map<Integer, MusicVO> cart = user.getCart();
		cart.remove((Integer) vo.getId());
		user.setCart(cart);
		return "ok";
		}
}
