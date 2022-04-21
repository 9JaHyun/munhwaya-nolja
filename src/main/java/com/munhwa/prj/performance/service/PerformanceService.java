package com.munhwa.prj.performance.service;

import java.util.List;
import java.util.Map;

import com.munhwa.prj.performance.vo.Criteria;
import com.munhwa.prj.performance.vo.PerformanceVO;

public interface PerformanceService {
	
	List<PerformanceVO> findAll();
	
	/* 게시판 목록(페이징 적용) */
	List<PerformanceVO> performanceSelectList(Criteria cri);
	
	List<PerformanceVO> adminSelectList(Criteria cri);
	
	int performanceInsert(PerformanceVO vo);
	
	PerformanceVO performanceSelect(PerformanceVO vo);
	
	/* 게시판 총 갯수 */
    public int admingetTotal(Criteria cri);
    
    public int getTotal(Criteria cri);
    
    int performanceUpdate(Map<String, Object> paramMap);
	
}
