package com.munhwa.prj.music.service;

import java.util.List;

import com.munhwa.prj.common.paging.entity.Criteria;
import com.munhwa.prj.music.vo.PurchaseVO;
import com.munhwa.prj.music.vo.PurchaseVO2;

public interface PurchaseService {
	List<Integer> purchaseSelectList(String id);
	List<PurchaseVO2> purchaseSelectList2(String id,Criteria cri);
	int getCountByList5(String id);
	int purchaseInsert(List<PurchaseVO> vo);
	int purchaseUpdate(PurchaseVO vo);
	int purchaseDelete(PurchaseVO vo);
}
