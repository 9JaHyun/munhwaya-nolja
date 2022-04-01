package com.munhwa.prj.performance.web;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.munhwa.prj.common.service.FileUtils;
import com.munhwa.prj.performance.service.PerformanceService;
import com.munhwa.prj.performance.vo.PerformanceVO;

@Controller
public class PerformanceController {
	@Autowired
	private PerformanceService performanceDao;
	@Autowired private FileUtils fileUtils;
	
    @GetMapping("/performance")
    public String performance(Model model) {
    	List <PerformanceVO> list = performanceDao.performanceSelectList();
    	
    	List<PerformanceVO> result = list.stream()
    			.filter(p -> p.getStatus().equals("A01"))
    			.collect(Collectors.toList());
    	
    	model.addAttribute("performances", result);
        return "performance/performance";
    }
    
    @RequestMapping("/performanceSelect.do")
    public String performanceSelect(PerformanceVO vo, Model model) {
    	vo = performanceDao.performanceSelect(vo);
    	model.addAttribute("performance", vo);
    	return "performance/performanceSelect";
    }
    
    @RequestMapping("/performanceInsertForm.do")
    public String performanceInsertForm() {
    	return "performance/performanceInsertForm";
    }
    
    // 공연신청
    @RequestMapping("/performanceInsert.do")
    public String performanceInsert(PerformanceVO vo) {
    	vo.setArtistId(2);
//    	fileUtils.storeFile(null)
    	vo.getImage();
    	int n = performanceDao.performanceInsert(vo);
    	if(n != 0 ) {
    		return "redirect:performance";
    	}
    	return "performance/performanceError";
    }
    
    @RequestMapping("/performanceList.do")
    public String performanceList(PerformanceVO vo, Model model) {
    	vo = performanceDao.performanceSelect(vo);
    	model.addAttribute("performance", vo);
    	return "performance/performanceList";
    }
}
