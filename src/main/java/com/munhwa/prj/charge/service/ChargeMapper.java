package com.munhwa.prj.charge.service;

import java.util.List;

import com.munhwa.prj.charge.vo.ChargeVO;

public interface ChargeMapper {
	List<ChargeVO> listCharge();
	ChargeVO selectCharge(ChargeVO vo);
	int insertCharge(ChargeVO vo);
}
