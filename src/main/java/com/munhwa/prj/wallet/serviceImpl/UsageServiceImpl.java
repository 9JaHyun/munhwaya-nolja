package com.munhwa.prj.wallet.serviceImpl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.munhwa.prj.common.paging.entity.Criteria;
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


	@Override
	public int refundOfMusic(Map<String, Object> vo) {
		return map.refundOfMusic(vo);
	}

	@Override
	public int refundOfPerformance(Map<String, Object> vo) {
		return map.refundOfPerformance(vo);
	}


	@Override
	public List<UsageVO> selectById(int id, String place) {
		return map.selectById(id, place);
	}

	@Override
	public List<UsageVO> selectByMusicOfId(List<Integer> pks, String memberId) {
		List<UsageVO> resultList = new ArrayList<>();
		pks.forEach(pk -> 
				resultList.add(map.selectByMusicOfId(pk, memberId))
		);
		
		return resultList;
	}

}
