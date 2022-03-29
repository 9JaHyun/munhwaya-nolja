package com.munhwa.prj.usage.service;

import java.util.List;

import com.munhwa.prj.usage.vo.UsageVO;

public interface UsageMapper {
	List<UsageVO> listUsage();
	UsageVO selectUsage(UsageVO vo);
	int insertUsage(UsageVO vo);
}