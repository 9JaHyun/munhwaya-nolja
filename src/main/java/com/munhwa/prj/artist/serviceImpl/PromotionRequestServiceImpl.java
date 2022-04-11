package com.munhwa.prj.artist.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.munhwa.prj.artist.mapper.PromotionRequestMapper;
import com.munhwa.prj.artist.service.PromotionRequestService;
import com.munhwa.prj.artist.vo.PromotionRequestVO;

@Repository("promotionRequestDao")
public class PromotionRequestServiceImpl implements PromotionRequestService {

	@Autowired 
	private PromotionRequestMapper map;
	@Override
	public List<PromotionRequestVO> promotionRequestSelectList() {
		// TODO Auto-generated method stub
		return map.promotionRequestSelectList();
	}

	@Override
	public PromotionRequestVO promotionRequestSelect(PromotionRequestVO vo) {
		// TODO Auto-generated method stub
		return map.promotionRequestSelect(vo);
	}

	@Override
	public int promotionRequestInsert(PromotionRequestVO vo) {
		// TODO Auto-generated method stub
		return map.promotionRequestInsert(vo);
	}

	@Override
	public int promotionRequestDelete(PromotionRequestVO vo) {
		// TODO Auto-generated method stub
		return map.promotionRequestDelete(vo);
	}

}
