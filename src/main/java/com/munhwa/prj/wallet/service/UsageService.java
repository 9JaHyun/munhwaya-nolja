package com.munhwa.prj.wallet.service;

import java.util.List;

import com.munhwa.prj.common.paging.entity.Criteria;
import com.munhwa.prj.wallet.vo.UsageVO;

public interface UsageService {
	// 곡 구매 내역
	List<UsageVO> findByMusic(String memberId, Criteria cri, String startDate, String endDate);
	Integer getCountByMusic(String id, String startDate, String endDate);
	Integer getSumByMusic(String id, String startDate, String endDate);
	// 공연 티켓 구매 내역
	List<UsageVO> findByPerformance(String memberId, Criteria cri, String startDate, String endDate);
	Integer getCountByPerformance(String id, String startDate, String endDate);
	Integer getSumByPerformance(String id, String startDate, String endDate);
	
	int insertUsage(List<UsageVO> vo);
}
