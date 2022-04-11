package com.munhwa.prj;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.munhwa.prj.music.vo.MusicVO;

@Controller
public class HomeController {

    @GetMapping("/home.do")
    public String homeDo() {
        return "home/home";
    }

    @GetMapping("/")
    public String home() {
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
}
