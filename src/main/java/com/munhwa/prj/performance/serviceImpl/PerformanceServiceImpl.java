package com.munhwa.prj.performance.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.munhwa.prj.performance.service.PerformanceMapper;
import com.munhwa.prj.performance.service.PerformanceService;
import com.munhwa.prj.performance.vo.PerformanceVO;

@Repository("performanceDao")
public class PerformanceServiceImpl implements PerformanceService {
	
	@Autowired
	private PerformanceMapper map;

	@Override
	public List<PerformanceVO> performanceSelectList() {
		return map.performanceSelectList();
	}

	@Override
	public int performanceInsert(PerformanceVO vo) {
		return map.performanceInsert(vo);
	}

	@Override
	public PerformanceVO performanceSelect(PerformanceVO vo) {
		return map.performanceSelect(vo);
	}

}
