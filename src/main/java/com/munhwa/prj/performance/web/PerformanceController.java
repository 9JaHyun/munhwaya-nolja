package com.munhwa.prj.performance.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.munhwa.prj.performance.service.PerformanceService;
import com.munhwa.prj.performance.vo.PerformanceVO;

@Controller
public class PerformanceController {
	@Autowired
	private PerformanceService performanceDao;
	
    @GetMapping("/performance")
    public String performance(Model model) {
    	List <PerformanceVO> list = performanceDao.performanceSelectList();
    	System.out.println(list);
    	model.addAttribute("performances", performanceDao.performanceSelectList());
        return "performance/performance";
    }
    
//    @RequestMapping("/performanceList")
//    public String performanceList() {
//
//    	return "performance/performance";
//    }
}
