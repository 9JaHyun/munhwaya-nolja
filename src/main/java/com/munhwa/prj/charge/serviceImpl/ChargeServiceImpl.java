package com.munhwa.prj.charge.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.munhwa.prj.charge.mapper.ChargeMapper;
import com.munhwa.prj.charge.service.ChargeService;
import com.munhwa.prj.charge.vo.ChargeVO;
import com.munhwa.prj.common.paging.entity.Criteria;

@Service("chargeDao")
public class ChargeServiceImpl implements ChargeService {
	@Autowired
	private ChargeMapper map;
	
	@Override
	public List<ChargeVO> findByMemberId(String memberId, Criteria cri, String startDate, String endDate) {
		return map.selectChargeListByMemberId(memberId,cri,startDate,endDate);
	}

	@Override
	public int insertCharge(ChargeVO vo) {
		return map.insertCharge(vo);
	}

	@Override
	public Integer getCountByMileage(String id, String startDate, String endDate) {
		return map.getCountByMileage(id, startDate, endDate);
	}

	@Override
	public Integer getCountByChargeId(String id, String startDate, String endDate) {
		return map.getCountByChargeId(id,startDate,endDate);
	}


}
