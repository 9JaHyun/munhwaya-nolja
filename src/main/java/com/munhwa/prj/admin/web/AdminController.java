package com.munhwa.prj.admin.web;

import com.munhwa.prj.artist.service.PromotionRequestService;
import com.munhwa.prj.artist.vo.PromotionRequestVO;
import com.munhwa.prj.common.vo.Criteria;
import com.munhwa.prj.common.vo.PageDTO;
import com.munhwa.prj.performance.service.PerformanceService;
import com.munhwa.prj.performance.vo.PerformanceVO;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@RequiredArgsConstructor
@Controller
public class AdminController {

    private final PerformanceService performanceService;
    private final PromotionRequestService promotionService;

    // 공연 신청 목록
    @GetMapping("admin/performances")
    public String changePerformanceStatus(Model model,
          @RequestParam(name = "pageNum", defaultValue = "1") int pageNum,
          @RequestParam(name = "amount", defaultValue = "10") int amount,
          @RequestParam(name = "keyword", defaultValue = "") String keyword) {

        Criteria cri = new Criteria(pageNum, amount, keyword);

        List<PerformanceVO> list = performanceService.performanceSelectList(cri);
        model.addAttribute("performances", list);
        int total = performanceService.getTotal(cri);
        PageDTO pageMake = new PageDTO(cri, total);
        model.addAttribute("pageMake", pageMake);
        return "admin/adminPerformanceList";
    }

    @GetMapping("admin/promotionRequests")
    public String promotionRequest(Model model,
          @RequestParam(name = "pageNum", defaultValue = "1") int pageNum,
          @RequestParam(name = "amount", defaultValue = "10") int amount,
          @RequestParam(name = "keyword", defaultValue = "") String keyword)  {
        Criteria cri = new Criteria(pageNum, amount, keyword);

        List<PromotionRequestVO> requests = promotionService.findAll(cri);
        model.addAttribute("requests", requests);
        int total = performanceService.getTotal(cri);
        PageDTO pageMake = new PageDTO(cri, total);
        model.addAttribute("pageMake", pageMake);
        return "admin/promotionRequest";
    }

    //공연 [승인&거절]
    @PostMapping("admin/performanceSelect")
    public @ResponseBody
    String changePerformanceStatus(int performanceId, @RequestParam String status) {
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

    // 아티스트 승급[승인&거절]
    @PostMapping("admin/changeRequest")
    public @ResponseBody
    String changeRequestStatus(int changeRequestId, @RequestParam String status) {
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("v_per_id", changeRequestId);
        paramMap.put("v_per_status", status);
        int result = performanceService.performanceUpdate(paramMap);
        if (result == 1) {
            return "성공";
        } else {
            return "실패";
        }
    }
}
