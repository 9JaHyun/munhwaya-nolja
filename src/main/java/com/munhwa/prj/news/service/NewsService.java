package com.munhwa.prj.news.service;

import java.util.List;

import com.munhwa.prj.news.vo.NewsVO;

public interface NewsService {
	
	List<NewsVO> findByMemberId(String memberId);

	int save(NewsVO vo);

	int deleteById(NewsVO vo);
}
