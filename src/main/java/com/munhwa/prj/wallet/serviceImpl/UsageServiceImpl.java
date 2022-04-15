package com.munhwa.prj.wallet.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.munhwa.prj.common.entity.Criteria;
import com.munhwa.prj.wallet.mapper.UsageMapper;
import com.munhwa.prj.wallet.service.UsageService;
import com.munhwa.prj.wallet.vo.UsageVO;
@Repository("usageDao")
public class UsageServiceImpl implements UsageService {
	@Autowired
	private UsageMapper map;
		
	@Override
	public List<UsageVO> findByMusic(String memberId, Criteria cri, String startDate, String endDate) {
		return map.selectUsageListMusic(memberId, cri, startDate, endDate);
	}

	@Override
	public Integer getCountByMusic(String id, String startDate, String endDate) {
		return map.getCountByMusic(id, startDate, endDate);
	}

	@Override
	public List<UsageVO> findByPerformance(String memberId, Criteria cri, String startDate, String endDate) {
		return map.selectUsageListPerformance(memberId, cri, startDate, endDate);
	}

	@Override
	public Integer getCountByPerformance(String id, String startDate, String endDate) {
		return map.getCountByPerformance(id, startDate, endDate);
	}

	@Override
	public int insertUsage(List<UsageVO> vo) {
		int cnt = 0;
		for (UsageVO usageVO : vo) {
			map.insertUsage(usageVO);
		}
		return cnt;
	}

	@Override
	public Integer getSumByMusic(String id, String startDate, String endDate) {
		return map.getSumByMusic(id, startDate, endDate);
	}

	@Override
	public Integer getSumByPerformance(String id, String startDate, String endDate) {
		return map.getSumByPerformance(id, startDate, endDate);
	}

}
