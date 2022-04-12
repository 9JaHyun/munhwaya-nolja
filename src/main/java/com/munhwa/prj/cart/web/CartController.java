package com.munhwa.prj.cart.web;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import com.munhwa.prj.config.auth.LoginUser;
import com.munhwa.prj.config.auth.dto.SessionUser;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.munhwa.prj.music.service.MusicService;
import com.munhwa.prj.music.vo.MusicVO;

@Slf4j
@Controller
public class CartController {
	@Autowired
	private MusicService musicDao;

	//	@GetMapping("/shop/cart")
	@RequestMapping("/cart")
	public String listCart(@LoginUser SessionUser user,  Model model) {
		@SuppressWarnings("unchecked")
		Map<Integer, MusicVO> cart = user.getCart();
		model.addAttribute("carts", cart);
		return "cart/shop_cart";
	}

	@RequestMapping("/cart/test/add")
	   public ResponseEntity<String> addCart(@LoginUser SessionUser user, HttpServletRequest req, @RequestParam int id) {
	      MusicVO vo = musicDao.musicSelect(id);
	      System.out.println(vo.getId());
	      
	      @SuppressWarnings("unchecked")
	      Map<Integer, MusicVO> map = user.getCart();
	      map.put(vo.getId(), vo);
	      user.setCart(map);
	      log.info("id={}", vo.getId());
	      return ResponseEntity.ok().body("추가 완료");
	   }
	
	@PostMapping("/deleteCart")
	@ResponseBody
	public String deleteCart(@LoginUser SessionUser user, MusicVO vo) {
		@SuppressWarnings("unchecked")
		Map<Integer, MusicVO> cart = user.getCart();
		cart.remove((Integer) vo.getId());
		user.setCart(cart);
		return "ok";
		}
}
