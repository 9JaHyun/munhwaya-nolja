package com.munhwa.prj.wallet.service;

import java.util.List;

import com.munhwa.prj.common.vo.Criteria;
import com.munhwa.prj.wallet.vo.ProfitVO;

public interface ProfitService {
	List<ProfitVO> findByMemberId(String memberId, Criteria cri);
	int getCountByProfitId(String id);
	ProfitVO selectProfit(ProfitVO vo);
	int insertProfit(List<ProfitVO> vo);
}
