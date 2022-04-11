package com.munhwa.prj.artist.serviceImpl;

import com.munhwa.prj.artist.mapper.PromotionRequestMapper;
import com.munhwa.prj.artist.service.PromotionRequestService;
import com.munhwa.prj.artist.vo.PromotionRequestVO;
import com.munhwa.prj.common.vo.Criteria;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

@RequiredArgsConstructor
@Repository("promotionRequestDao")
public class PromotionRequestServiceImpl implements PromotionRequestService {

	private final PromotionRequestMapper map;

	@Override
	public List<PromotionRequestVO> findAll(Criteria cri) {
		return map.selectPromotionRequestList(cri);
	}

	@Override
	public PromotionRequestVO findByMemberId(String id) {
		return map.selectPromotionRequest(id);
	}

	@Override
	public int save(PromotionRequestVO vo) {
		return 0;
	}

	@Override
	public int delete(PromotionRequestVO vo) {
		return 0;
	}

	@Override
	public int update(PromotionRequestVO vo) {
		return 0;
	}
}
