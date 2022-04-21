package com.munhwa.prj.post.service;

import com.munhwa.prj.post.vo.CommentShowVO;
import com.munhwa.prj.post.vo.CommentVO;
import java.util.List;

public interface CommentService {

    int save(CommentVO vo);

    int update(CommentVO vo);

    int deleteById(int id);

    List<CommentShowVO> findByPostId(int id);
}
