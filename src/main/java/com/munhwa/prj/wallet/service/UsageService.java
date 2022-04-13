package com.munhwa.prj.wallet.service;

import java.util.List;

import com.munhwa.prj.common.vo.Criteria;
import com.munhwa.prj.wallet.vo.UsageVO;

public interface UsageService {
	// 곡 구매 내역
	List<UsageVO> findByMusic(String memberId, Criteria cri);
	int getCountByMusic(String id);
	// 공연 티켓 구매 내역
	List<UsageVO> findByPerformance(String memberId, Criteria cri);
	int getCountByPerformance(String id);
	
	int insertUsage(List<UsageVO> vo);
}
