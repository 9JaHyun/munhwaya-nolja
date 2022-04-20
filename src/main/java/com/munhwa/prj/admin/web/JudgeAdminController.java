package com.munhwa.prj.admin.web;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.munhwa.prj.artist.service.PromotionRequestService;
import com.munhwa.prj.artist.vo.PromotionRequestVO;
import com.munhwa.prj.common.paging.entity.Criteria;
import com.munhwa.prj.common.paging.entity.PageDTO;

@Controller
public class JudgeAdminController {
	 @Autowired
	    private PromotionRequestService proDao;
	 
	   // 아티스트 승급 신청 목록
	    @GetMapping("/judgeArtist")
	    public String permitArtistList(Model model, Criteria cri) {
	    	List<PromotionRequestVO> vo = proDao.promotionRequestSelectList(cri);
	    	model.addAttribute("requestLists", vo);
	    	
	    	int total = proDao.getTotal(cri); 
	    	PageDTO pageMake = new PageDTO(cri, total);
	    	model.addAttribute("pageMake", pageMake);
	    	return "judgeArtist-admin";
	    }
	    
	    // 아티스트 단건 조회
	    @PostMapping("/judgeArtistOfMemberId")
	    @ResponseBody
	    public PromotionRequestVO judgeArtistOfMemberId(Model model,@RequestParam("memberId") String memberId) {
	    	System.out.println(memberId);
//	    	model.addAttribute("request", proDao.promotionRequestSelect(memberId));
	    	return proDao.promotionRequestSelect(memberId);
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
	    	
	    	proDao.promotionRequestUpdate(paramMap);
			
	    	return "성공";
	    	
	    }
	    
}
