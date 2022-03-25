package com.munhwa.prj.charge.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.munhwa.prj.charge.service.ChargeMapper;
import com.munhwa.prj.charge.service.ChargeService;
import com.munhwa.prj.charge.vo.ChargeVO;
@Repository("chargeDao")
public class ChargeServiceImpl implements ChargeService {
	@Autowired
	private ChargeMapper map;
	
	@Override
	public List<ChargeVO> listCharge() {
		return map.listCharge();
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
