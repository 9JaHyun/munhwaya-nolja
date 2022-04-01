package com.munhwa.prj;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
    
    // 강제적으로 세션 "member" 생성
    @GetMapping("/create-member")
    public @ResponseBody String createSession(HttpServletRequest req) {
    	req.getSession().setAttribute("member", "test1@gmail.com");
    	return "ok";
    }
}
