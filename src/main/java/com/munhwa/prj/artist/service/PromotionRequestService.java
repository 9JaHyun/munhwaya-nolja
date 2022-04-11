package com.munhwa.prj.artist.service;

import java.util.List;

import com.munhwa.prj.artist.vo.PromotionRequestVO;

public interface PromotionRequestService {
	
	List<PromotionRequestVO> promotionRequestSelectList();
	PromotionRequestVO promotionRequestSelect(PromotionRequestVO vo);
	int promotionRequestInsert(PromotionRequestVO vo);
	int promotionRequestDelete(PromotionRequestVO vo);
}
