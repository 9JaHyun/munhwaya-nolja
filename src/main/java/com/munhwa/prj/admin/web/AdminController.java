package com.munhwa.prj.admin.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.munhwa.prj.performance.service.PerformanceService;
import com.munhwa.prj.performance.vo.Criteria;
import com.munhwa.prj.performance.vo.PageMakeDTO;
import com.munhwa.prj.performance.vo.PerformanceVO;

@Controller
public class AdminController {
	
	@Autowired
	private PerformanceService performanceService;
	
	// 공연 신청 목록
	@GetMapping("admin/performanceList")
	public String changePerformanceStatus(Model model, Criteria cri) {
		List<PerformanceVO> list = performanceService.performanceSelectList(cri);
		
    	model.addAttribute("performances", list);
    	
    	int total = performanceService.getTotal(cri);
    	
    	PageMakeDTO pageMake = new PageMakeDTO(cri, total);
    	
    	model.addAttribute("pageMake", pageMake);
    	return "admin/adminPerformanceList";
	}
	
	// 공연 [승인&거절]
//	@PostMapping("admin/performanceSelect")
//	public @ResponseBody String changePerformanceStatus(int performanceId, String status, PerformanceVO vo, Model model) {
//		Map<String, Object> paramMap = new HashMap<>();
//		paramMap.put("v_per_id", performanceId);
//		paramMap.put("v_per_status", status);
//		int result = performanceService.performanceUpdate(paramMap);
//		if(result == 1) {
//			return "성공";
//		} else {
//			return "실패";
//		}
//	}
}
