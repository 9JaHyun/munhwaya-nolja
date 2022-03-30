package com.munhwa.prj.charge.mapper;

import java.util.List;

import com.munhwa.prj.charge.vo.ChargeVO;

public interface ChargeMapper {
	List<ChargeVO> selectChargeListByMemberId(String memberId);

	ChargeVO selectCharge(ChargeVO vo);

	int insertCharge(ChargeVO vo);
}
