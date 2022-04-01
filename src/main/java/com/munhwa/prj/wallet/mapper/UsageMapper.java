package com.munhwa.prj.wallet.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.munhwa.prj.common.vo.Criteria;
import com.munhwa.prj.wallet.vo.UsageVO;

public interface UsageMapper {
	List<UsageVO> selectUsageListMemberId(@Param("memberId") String memberId, @Param("cri") Criteria cri);
	int getCountByUsageId(String id);
	UsageVO selectUsage(UsageVO vo);
	int insertUsage(UsageVO vo);
}
