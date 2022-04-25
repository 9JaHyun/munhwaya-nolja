package com.munhwa.prj.admin.web;

import com.munhwa.prj.artist.service.PromotionRequestService;
import com.munhwa.prj.artist.vo.PromotionRequestVO;
import com.munhwa.prj.common.paging.entity.Criteria;
import com.munhwa.prj.common.paging.entity.PageDTO;
import com.munhwa.prj.performance.service.PerformanceService;
import com.munhwa.prj.performance.vo.PerformanceVO;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Slf4j
@RequiredArgsConstructor
@Controller
public class AdminController {

    private final PerformanceService performanceService;
    private final PromotionRequestService promotionRequestService;

    // 공연 신청 목록
    @GetMapping("performanceList")
    public String changePerformanceStatus(Model model, Criteria cri, PerformanceVO vo) {
        List<PerformanceVO> list = performanceService.adminSelectList(cri);

        model.addAttribute("performances", list);

        int total = performanceService.admingetTotal(cri);

        PageDTO pageMake = new PageDTO(cri, total);

        model.addAttribute("pageMake", pageMake);
        return "adminPerformanceList-admin";
    }

    //공연 [승인&거절]
    @PostMapping("performanceSelect")
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

    // 아티스트 승급 신청 목록
    @GetMapping("/judgeArtist")
    public String permitArtistList(Model model, Criteria cri) {
        List<PromotionRequestVO> vo = promotionRequestService.promotionRequestSelectList(cri);
        model.addAttribute("requestLists", vo);

        int total = promotionRequestService.getTotal(cri);
        PageDTO pageMake = new PageDTO(cri, total);
        model.addAttribute("pageMake", pageMake);
        return "judgeArtist-admin";
    }

    // 아티스트 단건 조회
    @PostMapping("/judgeArtistOfMemberId")
    @ResponseBody
    public PromotionRequestVO judgeArtistOfMemberId(Model model,
          @RequestParam("memberId") String memberId) {
        return promotionRequestService.promotionRequestSelect(memberId);
    }

    // 아티스트 승인
    @PostMapping("/judgeResultOfArtist")
    @ResponseBody
    public String judgeResultOfArtist(@RequestParam String memberId, @RequestParam String status) {
        Date useDate = Date.from(LocalDateTime.now().atZone(ZoneId.systemDefault()).toInstant());

        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("v_member_id", memberId);
        paramMap.put("v_status", status);
        paramMap.put("v_updated_at", useDate);

        promotionRequestService.promotionRequestUpdate(paramMap);
        return "성공";
    }
}
