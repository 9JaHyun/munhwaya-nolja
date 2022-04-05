package com.munhwa.prj;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.munhwa.prj.music.vo.MusicVO;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

    @GetMapping("/")
    public String home() {
        return "home/home";
    }
    
    @GetMapping("home.do")
    public String homeDo() {
        return "home/home";
    }

    @GetMapping("/404")
    public String errorPage() {
        return "error/404";
    }

    @GetMapping("/shop/cart")
    public String shopCartPage() {
        return "shop/shop_cart.artist";
    }
    

    // Session Cart 테스트
    @GetMapping("/createCart")
    public @ResponseBody String createCart(HttpServletRequest req) {
    	// 만약에 여러 사람이 접속했을 경우 cart가 곂친다면 -> memberID로 주기
    	Map<Integer, MusicVO> map = new HashMap<Integer, MusicVO>();
    	req.getSession().setAttribute("cart", map);
    	return "OK";
    }

    @GetMapping("/create-member")
    public @ResponseBody String createSession(HttpServletRequest req) {
    	req.getSession().setAttribute("member", "test1@gmail.com");
    	return "ok";

    }
}
