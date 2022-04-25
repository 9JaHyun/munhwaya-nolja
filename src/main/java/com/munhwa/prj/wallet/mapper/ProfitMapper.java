package com.munhwa.prj.wallet.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.munhwa.prj.common.paging.entity.Criteria;
import com.munhwa.prj.wallet.vo.ProfitVO;

public interface ProfitMapper {
	// 곡 수익 내역
	List<ProfitVO> selectProfitListMusic(@Param("memberId") String memberId, @Param("cri") Criteria cri, @Param("startDate") String startDate, @Param("endDate") String endDate);
	Integer getCountByMusic(@Param("memberId") String id, @Param("startDate") String startDate, @Param("endDate") String endDate);
	Integer getSumByMusic(@Param("memberId") String id, @Param("startDate") String startDate, @Param("endDate") String endDate);
	// 공연 티켓 수익 내역
	List<ProfitVO> selectProfitListPerformance(@Param("memberId") String memberId, @Param("cri") Criteria cri, @Param("startDate") String startDate, @Param("endDate") String endDate);
	Integer getCountByPerformance(@Param("memberId") String id, @Param("startDate") String startDate, @Param("endDate") String endDate);
	Integer getSumByPerformance(@Param("memberId") String id, @Param("startDate") String startDate, @Param("endDate") String endDate);
	int insertProfit(ProfitVO vo);
}
