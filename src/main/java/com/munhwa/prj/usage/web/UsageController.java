package com.munhwa.prj.usage.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.munhwa.prj.usage.service.UsageService;
import com.munhwa.prj.usage.vo.UsageVO;

@Controller
public class UsageController {
	@Autowired
	private UsageService usageDao;
	
	@PostMapping("/payCart")
	@ResponseBody
	public String payCart(UsageVO vo) {
		vo.setPlace("P01");
		usageDao.insertUsage(vo);
		return "home/home";
	}
}
