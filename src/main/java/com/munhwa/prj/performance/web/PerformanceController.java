package com.munhwa.prj.performance.web;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.munhwa.prj.artist.service.ArtistService;
import com.munhwa.prj.artist.vo.ArtistVO;
import com.munhwa.prj.common.file.service.FileUtils;
import com.munhwa.prj.common.paging.entity.Criteria;
import com.munhwa.prj.common.paging.entity.PageDTO;
import com.munhwa.prj.config.auth.LoginUser;
import com.munhwa.prj.config.auth.entity.SessionUser;
import com.munhwa.prj.performance.service.PerformanceService;
import com.munhwa.prj.performance.vo.PerformanceVO;

@Controller
public class PerformanceController {
	@Autowired
	private PerformanceService performanceDao;
	
	@Autowired
	private ArtistService artistDao;

	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

	@Autowired
	private FileUtils fileUtils;

	@GetMapping("/performance")
	public String performance(Model model, Criteria cri) {
		
		cri.setAmount(9);
		List<PerformanceVO> list = performanceDao.performanceSelectList(cri);
		

		model.addAttribute("performances", list);

		int total = performanceDao.getTotal(cri);

		PageDTO pageMake = new PageDTO(cri, total);

		model.addAttribute("pageMake", pageMake);

		return "performance/performance";
	}

	@RequestMapping("/performanceSelect.do")
	public String performanceSelect(@LoginUser SessionUser user, PerformanceVO vo, Model model) {
		vo = performanceDao.performanceSelect(vo);
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("v_per_id", vo.getId());
		// int n = performanceDao.performanceUpdate(paramMap);
		model.addAttribute("performance", vo);
		model.addAttribute("mileage", user.getMileage());
		model.addAttribute("artistname", vo.getArtistName());
		return "performance/performanceSelect";
	}

	@RequestMapping("/performanceInsertForm.do")
	public String performanceInsertForm(@LoginUser SessionUser user, Model model, String message) {
		ArtistVO artist = artistDao.findByMemberId(user.getId());
		model.addAttribute("artist", artist);
		model.addAttribute("message", message);
		return "performance/performanceInsertForm";
	}

	// Ajax FullCalendar 데이터 호출
	@ResponseBody
	@RequestMapping("/performances.do")
	public List<PerformanceCalendar> performances() {
		List<PerformanceVO> list = performanceDao.findAll();
		List<PerformanceCalendar> infoList = new ArrayList<>();

		for (PerformanceVO performance : list) {
			PerformanceCalendar info = new PerformanceCalendar();
			info.setTitle(performance.getName());
			info.setStart(date2String(performance.getSdate()));

			infoList.add(info);
		}
		return infoList;
	}

	// 공연신청
	@RequestMapping("/performanceInsert.do")
    public String performanceInsert(PerformanceVO vo, RedirectAttributes red) throws IOException {
    	String sdate = String.valueOf(vo.getSdate()).substring(0,10);
    	String edate = String.valueOf(vo.getEdate()).substring(0,10);
    
    	String sdatetime = String.valueOf(vo.getSdate()).substring(11,19);
    	String edatetime = String.valueOf(vo.getEdate()).substring(11,19);
    	
    	String sdatetime2[] = sdatetime.split(":");
    	String edatetime2[] = edatetime.split(":");
    	
    	String sdatetime3 = ""; 
    	for(int i = 0; i < sdatetime2.length; i++) {
    		sdatetime3 += sdatetime2[i];
    	}
    	
    	String edatetime3 = ""; 
    	for(int i = 0; i < edatetime2.length; i++) {
    		edatetime3 += edatetime2[i];
    	}
    	
    	int sdatetime4 = Integer.parseInt(sdatetime3);
    	int edatetime4 = Integer.parseInt(edatetime3);
    	
    	System.out.println("==========Sdate"+sdatetime);
    	System.out.println("==========Sdate tt"+sdatetime3);
    	System.out.println("==========Edate tt"+edatetime3);
    	Date date = new Date();
    	
    	// 중복 확인
		boolean result = performanceDao.findAll()
    						.stream()
    						.map(PerformanceVO::getSdate)
    						.map(d -> date2String(d))
    						.anyMatch(d -> d.equals(date2String(vo.getSdate())));
    	
		// 이미 그날에 공연이 존재하는가
    	if(result) {
    		red.addAttribute("message", "해당 일자에 공연이 존재합니다.");
    		return "redirect:performanceInsertForm.do";
    	}
    	
    	// 시작시간이 종료시간보다 이전이여야함
    	if(sdatetime4 > edatetime4) {
    		red.addAttribute("message", "시작시간이 종료시간보다 이전이여야 합니다.");
    		return "redirect:performanceInsertForm.do";
    	}
    	
    	// 오늘날짜보다 이전에는 등록 불가
    	if(vo.getSdate().before(date)) {		
    		red.addAttribute("message", "등록일자는 항상 오늘날짜보다 이후여야 합니다.");
    		return "redirect:performanceInsertForm.do";
    	}
    	
    	// 공연은 항상 당일치기
    	if(!sdate.equals(edate)) {
    		red.addAttribute("message", "시작날짜와 종료날짜가 같아야 합니다.");
    		return "redirect:performanceInsertForm.do";
		}
    	
    	red.addAttribute("message", "공연 신청이 완료되었습니다.");
		int n = performanceDao.performanceInsert(vo);    			    			
		if( n != 0 ) {
			return "redirect:performanceInsertForm.do";    			
		}
		return "redirect:performanceInsertForm.do"; 
	}

	@RequestMapping("/performanceList.do")
    public String performanceList(PerformanceVO vo, Model model) {
    	vo = performanceDao.performanceSelect(vo);
    	model.addAttribute("performance", vo);
    	return "performance/performanceList";
    }

	private String date2String(Date date) {
    	return format.format(date);
    }
}
