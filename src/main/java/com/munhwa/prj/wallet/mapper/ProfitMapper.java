package com.munhwa.prj.wallet.mapper;

import java.util.List;

import com.munhwa.prj.common.vo.Criteria;
import com.munhwa.prj.wallet.vo.ProfitVO;

public interface ProfitMapper {
	List<ProfitVO> selectProfitListMemberId(String memberId, Criteria cri);
	int getCountByProfitId(String id);
	ProfitVO selectProfit(ProfitVO vo);
	int insertProfit(ProfitVO vo);
}
