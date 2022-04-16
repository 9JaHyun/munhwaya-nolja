package com.munhwa.prj.common.file.serviceImpl;

import com.munhwa.prj.common.file.entity.UploadFileVO;
import com.munhwa.prj.common.file.mapper.UploadFileMapper;
import com.munhwa.prj.common.file.service.UploadFileService;
import java.util.List;
import org.springframework.stereotype.Service;

@Service
public class UploadFileServiceImpl implements UploadFileService {

    private final UploadFileMapper mapper;

    public UploadFileServiceImpl(UploadFileMapper mapper) {
        this.mapper = mapper;
    }

    @Override
    public int save(UploadFileVO vo) {
        return mapper.insertUploadFile(vo);
    }

    @Override
    public int change(UploadFileVO vo) {
        return mapper.updateUploadFile(vo);
    }

    @Override
    public int delete(UploadFileVO vo) {
        return mapper.deleteUploadFile(vo);
    }

    @Override
    public int deleteByGroupId(String groupId) {
        return mapper.deleteUploadFileByGroupId(groupId);
    }

    @Override
    public List<UploadFileVO> findByGroupId(String groupId) {
        return mapper.selectByGroupId(groupId);
    }

    @Override
    public UploadFileVO findById(int id) {
        return mapper.selectById(id);
    }
}
