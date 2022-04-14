package com.munhwa.prj.common.mapper;

import com.munhwa.prj.common.entity.UploadFileVO;
import java.util.List;
import java.util.Map;

public interface UploadFileMapper {

    int insertUploadFile(Map<String, Object> paramMap);

    int updateUploadFile(UploadFileVO vo);

    int deleteUploadFile(UploadFileVO vo);

    int deleteUploadFileByGroupId(String groupId);

    List<UploadFileVO> selectByGroupId(String groupId);

    UploadFileVO selectById(int id);
}
