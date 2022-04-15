package com.munhwa.prj.news.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.munhwa.prj.config.auth.LoginUser;
import com.munhwa.prj.config.auth.dto.SessionUser;
import com.munhwa.prj.news.service.NewsService;
import com.munhwa.prj.news.vo.NewsVO;

@Controller
public class NewsController {
	
	@Autowired
	private NewsService newsDao;
	
   	// 새소식 삭제
    @PostMapping("/deleteNews.do")
    public String deleteNews(@RequestBody NewsVO vo) {
    	newsDao.deleteNews(vo);
    	return "redirect:mypage.do";
    } 
    
    // 새소식 전체삭제
    @RequestMapping("/deleteNewsAll.do")
    public String deleteNewsAll(@LoginUser SessionUser user) {
    	NewsVO vo = new NewsVO();
    	vo.setMemberId(user.getId());
    	newsDao.deleteNewsAll(vo);
    	return "redirect:mypage.do";
    }

}
