package com.munhwa.prj.performance.web;

import com.munhwa.prj.common.service.FileUtils;
import com.munhwa.prj.common.vo.Criteria;
import com.munhwa.prj.common.vo.PageDTO;
import com.munhwa.prj.config.auth.LoginUser;
import com.munhwa.prj.config.auth.dto.SessionUser;
import com.munhwa.prj.performance.service.PerformanceService;
import com.munhwa.prj.performance.vo.PerformanceVO;
import java.io.IOException;
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

@Controller
public class PerformanceController {

    @Autowired
    private PerformanceService performanceDao;

    //@Autowired
    //private ArtistService artistDao;

    @Autowired
    private FileUtils fileUtils;

    @GetMapping("/performance")
    public String performance(Model model,
          @RequestParam(name = "pageNum", defaultValue = "1") int pageNum,
          @RequestParam(name = "amount", defaultValue = "10") int amount,
          @RequestParam(name = "keyword", defaultValue = "") String keyword) {

        Criteria cri = new Criteria(pageNum, amount, keyword);
        List<PerformanceVO> list = performanceDao.performanceSelectList(cri);

        List<PerformanceVO> result = list.stream()
              .filter(p -> p.getStatus().equals("승인"))
              .collect(Collectors.toList());

        model.addAttribute("performances", result);

        int total = performanceDao.getTotal(cri);

        PageDTO pageMake = new PageDTO(cri, total);

        model.addAttribute("pageMake", pageMake);

        //model.addAttribute("list", performanceDao.getListPaging(cri));
        return "performance/performance";
    }

    @RequestMapping("/performanceSelect.do")
    public String performanceSelect(@LoginUser SessionUser user, PerformanceVO vo, Model model) {
        vo = performanceDao.performanceSelect(vo);
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("v_per_id", vo.getId());
        //int n = performanceDao.performanceUpdate(paramMap);
        model.addAttribute("performance", vo);
        model.addAttribute("mileage", user.getMileage());
        return "performance/performanceSelect";
    }

    @RequestMapping("/performanceInsertForm.do")
    public String performanceInsertForm(@LoginUser SessionUser user, Model model) {
        //model.addAttribute("artist", artistDao.findById(user.getEmail()));
        model.addAttribute("artist", "artist");
        return "performance/performanceInsertForm";
    }

    // 공연신청
    @RequestMapping("/performanceInsert.do")
    public String performanceInsert(PerformanceVO vo) throws IOException {

        vo.setArtistId(42);
//    	fileUtils.storeFile(null)
        vo.getImage();

        int n = performanceDao.performanceInsert(vo);
        if (n != 0) {
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
