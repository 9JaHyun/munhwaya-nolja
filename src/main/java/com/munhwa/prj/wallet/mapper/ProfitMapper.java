package com.munhwa.prj.wallet.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.munhwa.prj.common.vo.Criteria;
import com.munhwa.prj.wallet.vo.ProfitVO;

public interface ProfitMapper {
	// 곡 수익 내역
	List<ProfitVO> selectProfitListMusic(@Param("memberId") String memberId, @Param("cri") Criteria cri);
	int getCountByMusic(String id);
	// 공연 티켓 수익 내역
	List<ProfitVO> selectProfitListPerformance(@Param("memberId") String memberId, @Param("cri") Criteria cri);
	int getCountByPerformance(String id);
	int insertProfit(ProfitVO vo);
}
