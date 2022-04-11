package com.munhwa.prj.wallet.mapper;

import com.munhwa.prj.common.vo.Criteria;
import com.munhwa.prj.wallet.vo.UsageVO;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface UsageMapper {
	List<UsageVO> selectUsageListMemberId(@Param("memberId") String memberId, @Param("cri") Criteria cri);
	int getCountByUsageId(String id);
	int insertUsage(UsageVO usageVO);
}