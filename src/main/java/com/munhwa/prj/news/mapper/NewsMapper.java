package com.munhwa.prj.news.mapper;

import java.util.List;

import com.munhwa.prj.news.vo.NewsVO;

public interface NewsMapper {
	
	// 새소식 리스트
	List<NewsVO> newsList(String memberId);
	
	// 새소식 삭제
	int deleteNews(NewsVO vo);
	
	// 새소식 전체삭제
	int deleteNewsAll(NewsVO vo);

}
