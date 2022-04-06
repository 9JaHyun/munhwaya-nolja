package com.munhwa.prj.wallet.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.munhwa.prj.common.vo.Criteria;
import com.munhwa.prj.wallet.vo.ProfitVO;

public interface ProfitMapper {
	List<ProfitVO> selectProfitListMemberId(@Param("memberId") String memberId, @Param("cri") Criteria cri);
	int getCountByProfitId(String id);
	int insertProfit(ProfitVO vo);
}
