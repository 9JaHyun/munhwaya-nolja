package com.munhwa.prj.common.file.service;

import com.munhwa.prj.common.file.entity.UploadFileVO;
import java.util.List;

public interface UploadFileService {
    int save(UploadFileVO vo);

    int change(UploadFileVO vo);

    int delete(UploadFileVO vo);

    int deleteByGroupId(String groupId);

    List<UploadFileVO> findByGroupId(String groupId);

    UploadFileVO findById(int id);
}
