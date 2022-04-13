package com.munhwa.prj.wallet.service;

import java.util.List;

import com.munhwa.prj.common.vo.Criteria;
import com.munhwa.prj.wallet.vo.ProfitVO;

public interface ProfitService {
	// 곡 수익 내역
	List<ProfitVO> findByMusic(String memberId, Criteria cri);
	int getCountByMusic(String id);
	// 공연 티켓 수익 내역 
	List<ProfitVO> findByPerformance(String memberId, Criteria cri);
	int getCountByPerformance(String id);
	
	int insertProfit(List<ProfitVO> vo);
}
