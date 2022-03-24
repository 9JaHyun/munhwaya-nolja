package com.munhwa.prj.music.service;

import java.util.List;

import com.munhwa.prj.music.vo.PurchaseVO;

public interface PurchaseMapper {
	List<PurchaseVO> purchaseSelectList();
	PurchaseVO purchaseSelect(PurchaseVO vo);
	int purchaseInsert(PurchaseVO vo);
	int purchaseUpdate(PurchaseVO vo);
	int purchaseDelete(PurchaseVO vo);
}
