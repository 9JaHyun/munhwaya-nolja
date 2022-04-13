package com.munhwa.prj.post.service;

import com.munhwa.prj.post.vo.PostVO;
import java.util.List;

public interface PostService {
    int save(PostVO vo);
    int update(PostVO vo);
    int deleteById(int id);
    PostVO findById(int id);
    List<PostVO> findAll();
    List<PostVO> findByFilter(String filter, String value, int pageNum, int amount);
}
