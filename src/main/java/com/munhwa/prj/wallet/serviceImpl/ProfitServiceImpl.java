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
	public int getCountByProfitId(String id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ProfitVO selectProfit(ProfitVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertProfit(ProfitVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}


}
