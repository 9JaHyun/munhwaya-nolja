package com.munhwa.prj.news.serviceImpl;

import com.munhwa.prj.news.mapper.NewsMapper;
import com.munhwa.prj.news.service.NewsService;
import com.munhwa.prj.news.vo.NewsVO;
import java.util.List;
import org.springframework.stereotype.Service;


@Service
public class NewsServiceImpl implements NewsService {

	private final NewsMapper map;

	public NewsServiceImpl(NewsMapper map) {
		this.map = map;
	}

	@Override
	public List<NewsVO> findByMemberId(String memberId) {
		return map.newsList(memberId);
	}

	@Override
	public int save(NewsVO vo) {
		return map.insertNews(vo);
	}

	@Override
	public int deleteById(NewsVO vo) {
		return map.deleteNews(vo);
	}
}
