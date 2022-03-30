package com.munhwa.prj.wallet.mapper;

import java.util.List;

import com.munhwa.prj.wallet.vo.UsageVO;

public interface UsageMapper {
	List<UsageVO> listUsage();
	UsageVO selectUsage(UsageVO vo);
	int insertUsage(UsageVO vo);
}
