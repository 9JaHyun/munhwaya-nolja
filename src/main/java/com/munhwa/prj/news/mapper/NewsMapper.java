package com.munhwa.prj.news.mapper;

import java.util.List;

import com.munhwa.prj.news.vo.NewsVO;

public interface NewsMapper {
	
	List<NewsVO> newsList(String memberId);
	
	int deleteNews(NewsVO vo);

    int insertNews(NewsVO vo);
}
