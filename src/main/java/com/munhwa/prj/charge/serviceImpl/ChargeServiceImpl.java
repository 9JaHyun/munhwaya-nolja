package com.munhwa.prj.charge.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.munhwa.prj.charge.mapper.ChargeMapper;
import com.munhwa.prj.charge.service.ChargeService;
import com.munhwa.prj.charge.vo.ChargeVO;
import org.springframework.stereotype.Service;

@Service("chargeDao")
public class ChargeServiceImpl implements ChargeService {
	@Autowired
	private ChargeMapper map;
	
	@Override
	public List<ChargeVO> findByMemberId(String id) {
		return map.selectChargeListByMemberId(id);
	}

	@Override
	public ChargeVO selectCharge(ChargeVO vo) {
		return map.selectCharge(vo);
	}

	@Override
	public int insertCharge(ChargeVO vo) {
		return map.insertCharge(vo);
	}

}
