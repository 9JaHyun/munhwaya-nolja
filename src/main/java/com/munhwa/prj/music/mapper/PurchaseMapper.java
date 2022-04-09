package com.munhwa.prj.music.mapper;

import java.util.List;

import com.munhwa.prj.music.vo.PurchaseVO;

public interface PurchaseMapper {
	List<PurchaseVO> purchaseSelectList(String id);
	int purchaseInsert(PurchaseVO vo);
	int purchaseUpdate(PurchaseVO vo);
	int purchaseDelete(PurchaseVO vo);
}
