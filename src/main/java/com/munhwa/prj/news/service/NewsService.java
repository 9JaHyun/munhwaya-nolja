package com.munhwa.prj.news.service;

import java.util.List;

import com.munhwa.prj.news.vo.NewsVO;

public interface NewsService {
	
	
	// 새소식 리스트
	List<NewsVO> newsList(String memberId);
	
	// 새소식 삭제
	int deleteNews(NewsVO vo);

}
