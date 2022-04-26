package com.munhwa.prj.performance.service;

import java.util.List;
import java.util.Map;

import com.munhwa.prj.common.paging.entity.Criteria;
import com.munhwa.prj.performance.vo.PerformanceVO;

public interface PerformanceService {
	
	List<PerformanceVO> findAll();
	
	/* 게시판 목록(페이징 적용) */
	List<PerformanceVO> performanceSelectList(Criteria cri);
	
	List<PerformanceVO> adminSelectList(Criteria cri);
	
	int performanceInsert(PerformanceVO vo);
	
	PerformanceVO performanceSelect(PerformanceVO vo);
	
	List<PerformanceVO> selectPerformanceByArtistId(String memberId);
	
	PerformanceVO detailPerformance(int id);
	
	int updatePerformance(PerformanceVO vo);
	
	/* 게시판 총 갯수 */
	int admingetTotal(Criteria cri);
    
	int getTotal(Criteria cri);
    
    int performanceUpdate(Map<String, Object> paramMap);
	
}
