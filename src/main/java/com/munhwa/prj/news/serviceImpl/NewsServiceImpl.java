package com.munhwa.prj.news.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.munhwa.prj.news.mapper.NewsMapper;
import com.munhwa.prj.news.service.NewsService;
import com.munhwa.prj.news.vo.NewsVO;


@Repository("newsDao")
public class NewsServiceImpl implements NewsService {

	@Autowired
	private NewsMapper map;
	
	@Override
	public List<NewsVO> newsList(String memberId) {
		return map.newsList(memberId);
	}

	@Override
	public int deleteNews(NewsVO vo) {
		return map.deleteNews(vo);
	}

}
