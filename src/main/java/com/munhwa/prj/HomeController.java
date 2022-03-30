package com.munhwa.prj;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

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

    @GetMapping("/shop")
    public String shopPage() {
        return "shop/shop";
    }
    

}
