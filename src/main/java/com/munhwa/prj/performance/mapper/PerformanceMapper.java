package com.munhwa.prj.performance.mapper;

import java.util.List;
import java.util.Map;


import com.munhwa.prj.common.paging.entity.Criteria;
import com.munhwa.prj.performance.vo.PerformanceVO;

public interface PerformanceMapper {
	List<PerformanceVO> performanceSelectAll();
	
	/* 게시판 목록(페이징 적용) */
	List<PerformanceVO> performanceSelectList(Criteria cri);
	
	List<PerformanceVO> adminSelectList(Criteria cri);
	
	int performanceInsert(PerformanceVO vo);
	
	PerformanceVO performanceSelect(PerformanceVO vo);

	List<PerformanceVO> selectPerformanceByArtistId(PerformanceVO vo);

    /* 게시판 총 갯수 */
    int admingetTotal(Criteria cri);
    
    int getTotal(Criteria cri);
    
    int performanceUpdate(Map<String, Object> paramMap);
	
}
