package com.munhwa.prj.charge.service;

import java.util.Date;
import java.util.List;

import com.munhwa.prj.charge.vo.ChargeVO;
import com.munhwa.prj.common.vo.Criteria;

public interface ChargeService {
	// 상세 지갑 정보 
	List<ChargeVO> findByMemberId(String memberId, Criteria cri, String startDate, String endDate);
	// 충전 내역 카운트
	int getCountByChargeId(String id, String startDate, String endDate);
	int insertCharge(ChargeVO vo);
}
