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
	public List<ProfitVO> findByMemberId(String memberId, Criteria cri) {
		return map.selectProfitListMemberId(memberId, cri);
	}

	@Override
	public ProfitVO selectProfit(ProfitVO vo) {
		return map.selectProfit(vo);
	}
	
	@Override
	public int getCountByProfitId(String id) {
		return map.getCountByProfitId(id);
	}

	@Override
	public int insertProfit(ProfitVO vo) {
		return map.insertProfit(vo);
	}



}
