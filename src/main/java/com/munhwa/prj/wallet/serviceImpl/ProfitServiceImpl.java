package com.munhwa.prj.wallet.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.munhwa.prj.common.vo.Criteria;
import com.munhwa.prj.wallet.mapper.ProfitMapper;
import com.munhwa.prj.wallet.service.ProfitService;
import com.munhwa.prj.wallet.vo.ProfitVO;
@Repository("profitDao")
public class ProfitServiceImpl implements ProfitService {
	@Autowired
	private ProfitMapper map;
	
	@Override
	public List<ProfitVO> findByMusic(String memberId, Criteria cri) {
		return map.selectProfitListMusic(memberId, cri);
	}

	@Override
	public int getCountByMusic(String id) {
		return map.getCountByMusic(id);
	}

	@Override
	public List<ProfitVO> findByPerformance(String memberId, Criteria cri) {
		return map.selectProfitListPerformance(memberId, cri);
	}

	@Override
	public int getCountByPerformance(String id) {
		return map.getCountByPerformance(id);
	}
	
	@Override
	public int insertProfit(List<ProfitVO> vo) {
		int cnt = 0;
		for (ProfitVO profitVO : vo) {
			map.insertProfit(profitVO);
		}
		return cnt;
	}

}
