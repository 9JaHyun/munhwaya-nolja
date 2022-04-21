package com.munhwa.prj.post.mapper;

import com.munhwa.prj.post.vo.CommentVO;
import java.util.List;
import java.util.Map;

public interface CommentMapper {

    int insertComment(CommentVO vo);

    int updateComment(CommentVO vo);

    int deleteCommentById(Map<String, Object> paramMap);

    CommentVO selectById(int id);

    List<CommentVO> selectListByPostId(int id);

}
