package com.munhwa.prj.post.serviceImpl;

import com.munhwa.prj.post.mapper.CommentMapper;
import com.munhwa.prj.post.service.CommentService;
import com.munhwa.prj.post.vo.CommentShowVO;
import com.munhwa.prj.post.vo.CommentVO;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Slf4j
@RequiredArgsConstructor
@Service
public class CommentServiceImpl implements CommentService {

    private final CommentMapper mapper;

    @Override
    public int save(CommentVO vo) {
        return mapper.insertComment(vo);
    }

    @Override
    public int update(CommentVO vo) {
        vo.setUpdatedAt(new Date());
        return mapper.updateComment(vo);
    }

    @Override
    public int deleteById(int id) {
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("v_comment_id", id);
        mapper.deleteCommentById(paramMap);
        return (int) paramMap.get("v_result");
    }

    @Override
    public List<CommentShowVO> findByPostId(int id) {
        return mapper.selectListByPostId(id);
    }
}
