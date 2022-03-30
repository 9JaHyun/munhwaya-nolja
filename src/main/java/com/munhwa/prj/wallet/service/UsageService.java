package com.munhwa.prj.wallet.service;

import java.util.List;

import com.munhwa.prj.wallet.vo.UsageVO;

public interface UsageService {
	List<UsageVO> listUsage();
	UsageVO selectUsage(UsageVO vo);
	int insertUsage(UsageVO vo);
}
