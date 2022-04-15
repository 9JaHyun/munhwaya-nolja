package com.munhwa.prj;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

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

    @GetMapping("/shop/cart")
    public String shopCartPage() {
        return "shop/shop_cart.artist";
    }
    
//    @Value("${openbank.access-token}")
//    private String access_token ="";
//    @Value("${openbank.client-id}")
//    private String clientId ="12ce99f4-e774-4231-ab01-e287c5d279fc";
//    @GetMapping("/")
//    public String home(Model model){
//        model.addAttribute("clientId", clientId);
//        model.addAttribute("access_token",access_token);
//        return "withdraw/home";
//    }
}
