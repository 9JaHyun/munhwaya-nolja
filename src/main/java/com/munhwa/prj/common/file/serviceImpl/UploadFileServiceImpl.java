package com.munhwa.prj.common.file.serviceImpl;

import com.munhwa.prj.common.file.entity.UploadFile;
import com.munhwa.prj.common.file.entity.UploadFileVO;
import com.munhwa.prj.common.file.mapper.UploadFileMapper;
import com.munhwa.prj.common.file.service.FileUtils;
import com.munhwa.prj.common.file.service.UploadFileService;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import org.springframework.stereotype.Service;

@Service
public class UploadFileServiceImpl implements UploadFileService {

    private final UploadFileMapper mapper;
    private final FileUtils fileUtils;

    public UploadFileServiceImpl(UploadFileMapper mapper,
          FileUtils fileUtils) {
        this.mapper = mapper;
        this.fileUtils = fileUtils;
    }

    @Override
    public String save(UploadFile file, String type, int id) {
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("v_oname", file.getOriginalFileName());
        paramMap.put("v_sname", file.getStoredFileName());
        paramMap.put("v_id", id);
        paramMap.put("v_proc_type", type);
        mapper.insertUploadFile(paramMap);
        return (String) paramMap.get("v_group_id");
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
        List<String> names = findByGroupId(groupId)
              .stream().map(UploadFileVO::getSname)
              .collect(Collectors.toList());

        int result = mapper.deleteUploadFileByGroupId(groupId);
        if (result != 0) {
            for (String name : names) {
                fileUtils.deleteFile(name);
            }
        }
        return result;
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
