package com.munhwa.prj.performance.serviceImpl;

import com.munhwa.prj.likeArtist.mapper.LikeArtistMapper;
import com.munhwa.prj.news.mapper.NewsMapper;
import com.munhwa.prj.news.vo.NewsVO;
import com.munhwa.prj.performance.mapper.PerformanceMapper;
import com.munhwa.prj.performance.service.PerformanceService;
import com.munhwa.prj.performance.vo.Criteria;
import com.munhwa.prj.performance.vo.PerformanceVO;
import java.util.Date;
import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Repository;

@Repository("performanceDao")
public class PerformanceServiceImpl implements PerformanceService {

    private final PerformanceMapper performanceMapper;
    private final NewsMapper newsMapper;
    private final LikeArtistMapper likeArtistMapper;

    public PerformanceServiceImpl(PerformanceMapper performanceMapper,
          NewsMapper newsMapper, LikeArtistMapper likeArtistMapper) {
        this.performanceMapper = performanceMapper;
        this.newsMapper = newsMapper;
        this.likeArtistMapper = likeArtistMapper;
    }

    @Override
    public List<PerformanceVO> performanceSelectList(Criteria cri) {
        return performanceMapper.performanceSelectList(cri);
    }

    @Override
    public int performanceInsert(PerformanceVO vo) {
        return performanceMapper.performanceInsert(vo);
    }

    @Override
    public PerformanceVO performanceSelect(PerformanceVO vo) {
        return performanceMapper.performanceSelect(vo);
    }

    @Override
    public int admingetTotal(Criteria cri) {
        return performanceMapper.admingetTotal(cri);
    }

    @Override
    public int performanceUpdate(Map<String, Object> paramMap) {

        int result = performanceMapper.performanceUpdate(paramMap);
        if (((String) paramMap.get("v_per_status")).equals("A01") && result != 0) {
            Date date = new Date();
            int artistId = (int) paramMap.get("v_artist_id");
            List<String> followers = likeArtistMapper.selectMemberListByArtistId(artistId);
            followers.forEach(follower -> {
                      NewsVO newsVO = new NewsVO();
                      newsVO.setArtistId(artistId);
                      newsVO.setMemberId(follower);
                      newsVO.setPks((int) paramMap.get("v_per_id"));
                      newsVO.setCode("N03");
                      newsVO.setCreatedAt(date);
                      newsMapper.insertNews(newsVO);
                  }
            );
        }

        return result;
    }

    @Override
    public List<PerformanceVO> findAll() {
        return performanceMapper.performanceSelectAll();
    }

    @Override
    public List<PerformanceVO> adminSelectList(Criteria cri) {
        return performanceMapper.adminSelectList(cri);
    }

	@Override
	public int getTotal(Criteria cri) {
		return performanceMapper.getTotal(cri);
	}

}
