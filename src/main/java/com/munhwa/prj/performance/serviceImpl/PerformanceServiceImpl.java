package com.munhwa.prj.performance.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.munhwa.prj.performance.mapper.PerformanceMapper;
import com.munhwa.prj.performance.service.PerformanceService;
import com.munhwa.prj.performance.vo.Criteria;
import com.munhwa.prj.performance.vo.PerformanceVO;

@Repository("performanceDao")
public class PerformanceServiceImpl implements PerformanceService {
	
	@Autowired
	private PerformanceMapper map;

	@Override
	public List<PerformanceVO> performanceSelectList(Criteria cri) {
		return map.performanceSelectList(cri);
	}

	@Override
	public int performanceInsert(PerformanceVO vo) {
		return map.performanceInsert(vo);
	}

	@Override
	public PerformanceVO performanceSelect(PerformanceVO vo) {
		return map.performanceSelect(vo);
	}

	@Override
	public int getTotal(Criteria cri) {
		return map.getTotal(cri);
	}

	@Override
	public int performanceUpdate(Map<String, Object> paramMap) {
		return map.performanceUpdate(paramMap);
	}

	@Override
	public List<PerformanceVO> findAll() {
		return map.performanceSelectAll();
	}

}
