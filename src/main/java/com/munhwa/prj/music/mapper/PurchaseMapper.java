package com.munhwa.prj.music.mapper;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.munhwa.prj.common.paging.entity.Criteria;
import com.munhwa.prj.music.vo.PurchaseVO;
import com.munhwa.prj.music.vo.PurchaseVO2;

public interface PurchaseMapper {
	List<Integer> purchaseSelectList(String id);
	List<PurchaseVO2> purchaseSelectList2(@Param("id") String id, @Param("cri")Criteria cri);
	int getCountByList5(String id);
	int purchaseInsert(PurchaseVO vo);
	int purchaseUpdate(PurchaseVO vo);
	int purchaseDelete(PurchaseVO vo);
	PurchaseVO2 purchaseSelectList3(@Param("memberId") String memberId, @Param("musicId") int musicId);
}
