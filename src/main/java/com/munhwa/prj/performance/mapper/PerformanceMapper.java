package com.munhwa.prj.performance.mapper;

import com.munhwa.prj.common.vo.Criteria;
import com.munhwa.prj.performance.vo.PerformanceVO;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Param;

public interface PerformanceMapper {

    List<PerformanceVO> performanceSelectList(Criteria cri);

    List<PerformanceVO> selectPerformancesByFilter(@Param("key") String key, @Param("cri") Criteria cri);

    int performanceInsert(PerformanceVO vo);

    PerformanceVO performanceSelect(PerformanceVO vo);

    int getTotal(Criteria cri);

    int performanceUpdate(Map<String, Object> paramMap);
}
