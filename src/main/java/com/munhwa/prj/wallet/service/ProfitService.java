package com.munhwa.prj.wallet.service;

import java.util.List;

import com.munhwa.prj.common.paging.entity.Criteria;
import com.munhwa.prj.wallet.vo.ProfitVO;

public interface ProfitService {

    // 곡 수익 내역
    List<ProfitVO> findByMusic(String memberId, Criteria cri, String startDate, String endDate);

    Integer getCountByMusic(String id, String startDate, String endDate);

    Integer getSumByMusic(String id, String startDate, String endDate);

    // 공연 티켓 수익 내역
    List<ProfitVO> findByPerformance(String memberId, Criteria cri, String startDate,
          String endDate);

    Integer getCountByPerformance(String id, String startDate, String endDate);

    Integer getSumByPerformance(String id, String startDate, String endDate);

    int insertProfit(List<ProfitVO> vo);
}
