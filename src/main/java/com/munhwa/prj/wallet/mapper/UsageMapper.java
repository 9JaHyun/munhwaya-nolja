package com.munhwa.prj.wallet.mapper;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.munhwa.prj.common.paging.entity.Criteria;
import com.munhwa.prj.wallet.vo.UsageVO;

public interface UsageMapper {
	// 곡 구매 내역
	List<UsageVO> selectUsageListMusic(@Param("memberId") String memberId, @Param("cri") Criteria cri, @Param("startDate") String startDate, @Param("endDate") String endDate);

	Integer getCountByMusic(@Param("memberId") String id, @Param("startDate") String startDate, @Param("endDate") String endDate);
	
	Integer getSumByMusic(@Param("memberId") String id, @Param("startDate") String startDate, @Param("endDate") String endDate);
	// 공연 티켓 구매 내역
	List<UsageVO> selectUsageListPerformance(@Param("memberId") String memberId, @Param("cri") Criteria cri, @Param("startDate") String startDate, @Param("endDate") String endDate);

	Integer getCountByPerformance(@Param("memberId") String id, @Param("startDate") String startDate, @Param("endDate") String endDate);
	
	Integer getSumByPerformance(@Param("memberId") String id, @Param("startDate") String startDate, @Param("endDate") String endDate);
	int insertUsage(UsageVO usageVO);
	
	// 환불 하기 프로시저
	int refundOfMusic(Map<String, Object> vo);
	int refundOfPerformance(Map<String, Object> vo);
		
	List<UsageVO> selectById(@Param("id") int id, @Param("place") String place);
	
	UsageVO selectByMusicOfId(@Param("pks") int pks, @Param("memberId") String memberId);
	
}