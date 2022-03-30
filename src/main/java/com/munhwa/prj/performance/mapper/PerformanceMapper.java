package com.munhwa.prj.performance.mapper;

import java.util.List;

import com.munhwa.prj.performance.vo.PerformanceVO;

public interface PerformanceMapper {
	List<PerformanceVO> performanceSelectList();
	int performanceInsert(PerformanceVO vo);
	PerformanceVO performanceSelect(PerformanceVO vo);
}
