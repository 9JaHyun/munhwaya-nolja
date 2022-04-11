package com.munhwa.prj.music.service;

import java.util.List;

import com.munhwa.prj.music.vo.PurchaseVO;

public interface PurchaseService {
	List<Integer> purchaseSelectList(String id);
	int purchaseInsert(List<PurchaseVO> vo);
	int purchaseUpdate(PurchaseVO vo);
	int purchaseDelete(PurchaseVO vo);
}
