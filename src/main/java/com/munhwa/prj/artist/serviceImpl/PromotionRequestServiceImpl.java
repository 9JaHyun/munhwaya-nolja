package com.munhwa.prj.artist.serviceImpl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.munhwa.prj.artist.mapper.PromotionRequestMapper;
import com.munhwa.prj.artist.service.PromotionRequestService;
import com.munhwa.prj.artist.vo.PromotionRequestVO;
import com.munhwa.prj.artist.web.PromotionRequestDTO;
import com.munhwa.prj.common.paging.entity.Criteria;

@Repository("promotionRequestDao")
public class PromotionRequestServiceImpl implements PromotionRequestService {

	@Autowired 
	private PromotionRequestMapper map;
	@Override
	public List<PromotionRequestVO> promotionRequestSelectList(Criteria cri) {
		return map.promotionRequestSelectList(cri);
	}

	@Override
	public PromotionRequestVO promotionRequestSelect(String memberId) {
		return map.promotionRequestSelect(memberId);
	}

	@Override
	public int promotionRequestInsert(PromotionRequestVO vo) {
		vo.setCreatedAt(new Date());
		return map.promotionRequestInsert(vo);
	}

	@Override
	public int promotionRequestDelete(PromotionRequestVO vo) {
		return map.promotionRequestDelete(vo);
	}


	@Override
	public int promotionRequestUpdate(Map<String, Object> vo) {
		return map.promotionRequestUpdate(vo);
	}

	@Override
	public int getTotal(Criteria cri) {
		return map.getTotal(cri);
	}

	@Override
	public String getStatus(String memberId) {
		// TODO Auto-generated method stub
		return map.getStatus(memberId);
	}

	@Override
	public String artStatusUpdate(PromotionRequestDTO dto) {
		// TODO Auto-generated method stub
		return map.artStatusUpdate(dto);
	}

	

}
