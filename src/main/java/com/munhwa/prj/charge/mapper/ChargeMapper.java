package com.munhwa.prj.charge.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.munhwa.prj.charge.vo.ChargeVO;
import com.munhwa.prj.common.vo.Criteria;

public interface ChargeMapper {
	// 상세 지갑 정보 
	List<ChargeVO> selectChargeListByMemberId(@Param("memberId") String memberId, @Param("cri") Criteria cri);
	
	// 충전 내역 카운트
	int getCountByChargeId(String id);
	
	int insertCharge(ChargeVO vo);
}
