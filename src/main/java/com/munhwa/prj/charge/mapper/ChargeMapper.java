package com.munhwa.prj.charge.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.munhwa.prj.charge.vo.ChargeVO;
import com.munhwa.prj.common.paging.entity.Criteria;

public interface ChargeMapper {
	// 상세 지갑 정보 
	List<ChargeVO> selectChargeListByMemberId(@Param("memberId") String memberId, @Param("cri") Criteria cri, @Param("startDate") String startDate, @Param("endDate") String endDate);
	
	// 충전 내역 카운트
	Integer getCountByChargeId(@Param("memberId") String id, @Param("startDate") String startDate, @Param("endDate") String endDate);
	
	// 충전 가격 합
	Integer getCountByMileage(@Param("memberId") String id,  @Param("startDate") String startDate, @Param("endDate") String endDate);
	int insertCharge(ChargeVO vo);
}
