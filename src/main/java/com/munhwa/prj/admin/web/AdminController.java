package com.munhwa.prj.admin.web;

import com.munhwa.prj.performance.service.PerformanceService;
import com.munhwa.prj.performance.vo.Criteria;
import com.munhwa.prj.performance.vo.PageMakeDTO;
import com.munhwa.prj.performance.vo.PerformanceVO;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Slf4j
@Controller
public class AdminController {

    private final PerformanceService performanceService;

    public AdminController(PerformanceService performanceService) {
        this.performanceService = performanceService;
    }
    
    // 공연 신청 목록
    @GetMapping("admin/performanceList")
    public String changePerformanceStatus(Model model, Criteria cri, PerformanceVO vo,
          String filter) {
        List<PerformanceVO> list = performanceService.adminSelectList(cri);

        model.addAttribute("performances", list);

        int total = performanceService.getTotal(cri, filter);

        PageMakeDTO pageMake = new PageMakeDTO(cri, total);

        model.addAttribute("pageMake", pageMake);
        return "adminPerformanceList-admin";
    }

    //공연 [승인&거절]
    @PostMapping("admin/performanceSelect")
    public @ResponseBody
    String changePerformanceStatus(@RequestParam int performanceId, @RequestParam String status) {
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("v_per_id", performanceId);
        paramMap.put("v_per_status", status);
        int result = performanceService.performanceUpdate(paramMap);

        if (result == 1) {
            return "성공";
        } else {
            return "실패";
        }
    }
    
}
