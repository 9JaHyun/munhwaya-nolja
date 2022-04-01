package com.munhwa.prj.wallet.service;

import java.util.List;

import com.munhwa.prj.common.vo.Criteria;
import com.munhwa.prj.wallet.vo.UsageVO;

public interface UsageService {
	List<UsageVO> findByMemberId(String memberId, Criteria cri);
	int getCountByUsageId(String id);
	UsageVO selectUsage(UsageVO vo);
	int insertUsage(UsageVO vo);
}
