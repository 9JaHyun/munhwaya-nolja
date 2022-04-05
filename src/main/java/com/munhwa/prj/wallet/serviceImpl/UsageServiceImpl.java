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
	public List<UsageVO> findByMemberId(String memberId, Criteria cri) {
		return map.selectUsageListMemberId(memberId,cri);
	}

	@Override
	public UsageVO selectUsage(UsageVO vo) {
		return map.selectUsage(vo);
	}

	
	@Override
	public int getCountByUsageId(String id) {
		return map.getCountByUsageId(id);
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
