package com.munhwa.prj.music.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.munhwa.prj.music.service.PurchaseMapper;
import com.munhwa.prj.music.service.PurchaseService;
import com.munhwa.prj.music.vo.PurchaseVO;

@Repository("PurchaseDAO")
public class PurchaseServiceImpl implements PurchaseService{
	@Autowired
	private PurchaseMapper map;

	@Override
	public List<PurchaseVO> purchaseSelectList() {
		return map.purchaseSelectList();
	}

	@Override
	public PurchaseVO purchaseSelect(PurchaseVO vo) {
		return map.purchaseSelect(vo);
	}

	@Override
	public int purchaseInsert(PurchaseVO vo) {
		return map.purchaseInsert(vo);
	}

	@Override
	public int purchaseUpdate(PurchaseVO vo) {
		return map.purchaseUpdate(vo);
	}

	@Override
	public int purchaseDelete(PurchaseVO vo) {
		return map.purchaseDelete(vo);
	}
	

}