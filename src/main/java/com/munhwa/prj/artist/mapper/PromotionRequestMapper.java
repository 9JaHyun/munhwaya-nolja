package com.munhwa.prj.artist.mapper;

import com.munhwa.prj.common.vo.Criteria;
import java.util.List;

import com.munhwa.prj.artist.vo.PromotionRequestVO;

public interface PromotionRequestMapper{
	List<PromotionRequestVO> selectPromotionRequestList(Criteria cri);
	PromotionRequestVO selectPromotionRequest(String id);
	int insertPromotionRequest(PromotionRequestVO vo);
	int updatePromotionRequest(PromotionRequestVO vo);
	int deletePromotionRequest(PromotionRequestVO vo);
}
