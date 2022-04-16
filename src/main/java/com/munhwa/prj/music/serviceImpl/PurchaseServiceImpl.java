package com.munhwa.prj.music.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.munhwa.prj.common.paging.entity.Criteria;
import com.munhwa.prj.music.mapper.PurchaseMapper;
import com.munhwa.prj.music.service.PurchaseService;
import com.munhwa.prj.music.vo.PurchaseVO;
import com.munhwa.prj.music.vo.PurchaseVO2;

@Repository("PurchaseDAO")
public class PurchaseServiceImpl implements PurchaseService{
	@Autowired
	private PurchaseMapper map;

	@Override
	public List<Integer> purchaseSelectList(String id) {
		return map.purchaseSelectList(id);
	}

	@Override
	public int purchaseInsert(List<PurchaseVO> vo) {
		int cnt = 0;
		for(PurchaseVO purchaseVO : vo) {
			map.purchaseInsert(purchaseVO);
		}
		return cnt;
	}

	@Override
	public int purchaseUpdate(PurchaseVO vo) {
		return map.purchaseUpdate(vo);
	}

	@Override
	public int purchaseDelete(PurchaseVO vo) {
		return map.purchaseDelete(vo);
	}

	@Override
	public List<PurchaseVO2> purchaseSelectList2(String id,Criteria cri) {
		return map.purchaseSelectList2(id,cri);
	}

	@Override
	public int getCountByList5(String id) {
		return map.getCountByList5(id);
	}

}
