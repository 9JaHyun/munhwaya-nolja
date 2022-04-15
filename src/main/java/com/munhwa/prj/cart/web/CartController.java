package com.munhwa.prj.cart.web;

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
import com.munhwa.prj.config.auth.dto.SessionUser;
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

	@RequestMapping("/cart/add")
	public ResponseEntity<String> addCart(@LoginUser SessionUser user, @RequestParam int id) {
	      MusicVO vo = musicDAO.musicSelect(id);

	      Map<Integer, MusicVO> cart = user.getCart();
	      if(cart.containsKey(vo.getId()) ) {
	         return ResponseEntity.badRequest().body("");
	      }
	      cart.put(vo.getId(), vo);
	      user.setCart(cart);
//	      log.info("id={}", vo.getId());

	      return ResponseEntity.ok().body("");
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
