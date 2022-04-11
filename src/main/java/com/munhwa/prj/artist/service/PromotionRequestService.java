package com.munhwa.prj.artist.service;

import com.munhwa.prj.common.vo.Criteria;
import java.util.List;

import com.munhwa.prj.artist.vo.PromotionRequestVO;

public interface PromotionRequestService {
	
	List<PromotionRequestVO> findAll(Criteria cri);

	PromotionRequestVO findByMemberId(String id);

	int save(PromotionRequestVO vo);

	int delete(PromotionRequestVO vo);

	int update(PromotionRequestVO vo);
}
