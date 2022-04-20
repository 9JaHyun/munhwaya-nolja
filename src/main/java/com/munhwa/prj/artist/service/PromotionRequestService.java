package com.munhwa.prj.artist.service;

import java.util.List;
import java.util.Map;

import com.munhwa.prj.artist.vo.PromotionRequestVO;
import com.munhwa.prj.common.paging.entity.Criteria;

public interface PromotionRequestService {
	
	List<PromotionRequestVO> promotionRequestSelectList(Criteria cri);
	PromotionRequestVO promotionRequestSelect(String memberId);
	int promotionRequestInsert(PromotionRequestVO vo);
	int promotionRequestDelete(PromotionRequestVO vo);
	int promotionRequestUpdate(Map<String,Object> vo);
	
	/* 승급신청 리스트 총 갯수 */
    int getTotal(Criteria cri);
}
