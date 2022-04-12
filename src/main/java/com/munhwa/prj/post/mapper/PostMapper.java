package com.munhwa.prj.post.mapper;

import com.munhwa.prj.post.vo.PostVO;
import java.util.List;

public interface PostMapper {

    int insertPost(PostVO vo);
    int updatePost(PostVO vo);
    int deletePostById(int id);
    PostVO selectPostById(int id);
    List<PostVO> selectPosts();
    List<PostVO> selectPostsByFilter(String filter, String value);
}
