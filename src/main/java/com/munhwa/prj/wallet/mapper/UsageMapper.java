package com.munhwa.prj.wallet.mapper;

import com.munhwa.prj.common.vo.Criteria;
import com.munhwa.prj.wallet.vo.UsageVO;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface UsageMapper {
	// 곡 구매 내역
	List<UsageVO> selectUsageListMusic(@Param("memberId") String memberId, @Param("cri") Criteria cri);
	int getCountByMusic(String id);
	// 공연 티켓 구매 내역
	List<UsageVO> selectUsageListPerformance(@Param("memberId") String memberId, @Param("cri") Criteria cri);
	int getCountByPerformance(String id);
	int insertUsage(UsageVO usageVO);
}