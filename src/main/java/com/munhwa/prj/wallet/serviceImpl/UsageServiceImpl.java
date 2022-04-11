package com.munhwa.prj.wallet.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.munhwa.prj.common.vo.Criteria;
import com.munhwa.prj.wallet.mapper.UsageMapper;
import com.munhwa.prj.wallet.service.UsageService;
import com.munhwa.prj.wallet.vo.UsageVO;
@Repository("usageDao")
public class UsageServiceImpl implements UsageService {
	@Autowired
	private UsageMapper map;
		
	@Override
	public List<UsageVO> findByMusic(String memberId, Criteria cri) {
		return map.selectUsageListMusic(memberId, cri);
	}

	@Override
	public int getCountByMusic(String id) {
		return map.getCountByMusic(id);
	}

	@Override
	public List<UsageVO> findByPerformance(String memberId, Criteria cri) {
		return map.selectUsageListPerformance(memberId, cri);
	}

	@Override
	public int getCountByPerformance(String id) {
		return map.getCountByPerformance(id);
	}

	@Override
	public int insertUsage(List<UsageVO> vo) {
		int cnt = 0;
		for (UsageVO usageVO : vo) {
			map.insertUsage(usageVO);
		}
		return cnt;
	}

}
