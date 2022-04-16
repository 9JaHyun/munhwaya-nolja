package com.munhwa.prj.wallet.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.munhwa.prj.common.paging.entity.Criteria;
import com.munhwa.prj.wallet.mapper.ProfitMapper;
import com.munhwa.prj.wallet.service.ProfitService;
import com.munhwa.prj.wallet.vo.ProfitVO;
@Repository("profitDao")
public class ProfitServiceImpl implements ProfitService {
	@Autowired
	private ProfitMapper map;
	
	@Override
	public List<ProfitVO> findByMusic(String memberId, Criteria cri, String startDate, String endDate) {
		return map.selectProfitListMusic(memberId, cri, startDate, endDate);
	}

	@Override
	public Integer getCountByMusic(String id, String startDate, String endDate) {
		return map.getCountByMusic(id, startDate, endDate);
	}

	@Override
	public List<ProfitVO> findByPerformance(String memberId, Criteria cri, String startDate, String endDate) {
		return map.selectProfitListPerformance(memberId, cri, startDate, endDate);
	}

	@Override
	public Integer getCountByPerformance(String id, String startDate, String endDate) {
		return map.getCountByPerformance(id, startDate, endDate);
	}
	
	@Override
	public int insertProfit(List<ProfitVO> vo) {
		int cnt = 0;
		for (ProfitVO profitVO : vo) {
			map.insertProfit(profitVO);
		}
		return cnt;
	}

	@Override
	public Integer getSumByMusic(String id, String startDate, String endDate) {
		return map.getSumByMusic(id, startDate, endDate);
	}

	@Override
	public Integer getSumByPerformance(String id, String startDate, String endDate) {
		return map.getSumByPerformance(id, startDate, endDate);
	}

}
