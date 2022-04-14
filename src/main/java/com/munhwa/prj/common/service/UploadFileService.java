package com.munhwa.prj.common.service;

import com.munhwa.prj.common.entity.UploadFile;
import com.munhwa.prj.common.entity.UploadFileVO;
import java.util.List;

public interface UploadFileService {
    String save(UploadFile vo, String type, int id);

    int change(UploadFileVO vo);

    int delete(UploadFileVO vo);

    int deleteByGroupId(String groupId);

    List<UploadFileVO> findByGroupId(String groupId);

    UploadFileVO findById(int id);
}
