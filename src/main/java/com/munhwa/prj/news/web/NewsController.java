package com.munhwa.prj.news.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.munhwa.prj.news.service.NewsService;
import com.munhwa.prj.news.vo.NewsVO;

@Controller
public class NewsController {
	
	@Autowired
	private NewsService newsDao;
	
    @PostMapping("/deleteNews.do")
    public String deleteNews(@RequestBody NewsVO vo) {
    	newsDao.deleteById(vo);
    	return "redirect:mypage.do";
    }
}
