package com.munhwa.prj;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.munhwa.prj.cart.vo.MusicVO;

@Controller
public class HomeController {

    @GetMapping("/")
    public String home() {
        return "home/home";
    }

    @GetMapping("/404")
    public String errorPage() {
        return "error/404";
    }

    @GetMapping("/shop")
    public String shopPage() {
        return "shop/shop";
    }
    
    //카트 세션 테스트
    @GetMapping("/cart/test")
    @ResponseBody
    public String cart(HttpServletRequest req) {
    	Map<Integer, MusicVO> map = new HashMap<Integer, MusicVO>();
    	req.getSession().setAttribute("cart", map);
    	return "OK";
    }
    
    @GetMapping("/cart/test/add")
    @ResponseBody
    public String addCart(MusicVO vo,HttpServletRequest req) {
    	@SuppressWarnings("unchecked")
		Map<Integer, MusicVO> map = (Map<Integer, MusicVO>) req.getSession().getAttribute("cart");
    	map.put(vo.getId(), vo);
    	req.getSession().setAttribute("cart", map);
    	return "success";
    }
    
}
