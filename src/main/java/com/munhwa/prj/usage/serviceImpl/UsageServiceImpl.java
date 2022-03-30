package com.munhwa.prj.usage.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.munhwa.prj.usage.mapper.UsageMapper;
import com.munhwa.prj.usage.service.UsageService;
import com.munhwa.prj.usage.vo.UsageVO;
@Repository("usageDao")
public class UsageServiceImpl implements UsageService {
	@Autowired
	private UsageMapper map;
	
	@Override
	public List<UsageVO> listUsage() {
		return map.listUsage();
	}

	@Override
	public UsageVO selectUsage(UsageVO vo) {
		return map.selectUsage(vo);
	}

	@Override
	public int insertUsage(UsageVO vo) {
		return map.insertUsage(vo);
	}
	

}
