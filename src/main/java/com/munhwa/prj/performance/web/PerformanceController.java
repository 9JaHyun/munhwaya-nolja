package com.munhwa.prj.performance.web;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.munhwa.prj.artist.service.ArtistService;
import com.munhwa.prj.artist.vo.ArtistVO;
import com.munhwa.prj.common.file.service.FileUtils;
import com.munhwa.prj.config.auth.LoginUser;
import com.munhwa.prj.config.auth.entity.SessionUser;
import com.munhwa.prj.performance.service.PerformanceService;
import com.munhwa.prj.performance.vo.Criteria;
import com.munhwa.prj.performance.vo.PageMakeDTO;
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
	public String performance(Model model, Criteria cri, 
			@RequestParam(value = "filter", defaultValue = "A01") String filter) {
		List<PerformanceVO> list = performanceDao.performanceSelectList(cri);

		List<PerformanceVO> result = list.stream()
				.filter(p -> p.getStatus().equals("승인"))
				.collect(Collectors.toList());

		model.addAttribute("performances", result);

		int total = performanceDao.getTotal(cri, filter);

		PageMakeDTO pageMake = new PageMakeDTO(cri, total);

		model.addAttribute("pageMake", pageMake);

		// model.addAttribute("list", performanceDao.getListPaging(cri));
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
	public String performanceInsertForm(@LoginUser SessionUser user, Model model) {
		ArtistVO artist = artistDao.findByMemberId(user.getId());
		model.addAttribute("artist", artist);
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
    public String performanceInsert(PerformanceVO vo) throws IOException {
    	boolean result = performanceDao.findAll()
    						.stream()
    						.map(PerformanceVO::getSdate)
    						.map(d -> date2String(d))
    						.anyMatch(d -> d.equals(date2String(vo.getSdate())));
    	
    	if(result) {
    		return "performance/calendarError";
    	} else {
    		int n = performanceDao.performanceInsert(vo);
	    	if( n != 0 ) {
	    		return "redirect:performance";    			
	    	}
	    	return"performance/performanceError";
    	}

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
