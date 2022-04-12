package com.munhwa.prj.post.mapper;

import com.munhwa.prj.post.vo.PostVO;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface PostMapper {

    int insertPost(PostVO vo);
    int updatePost(PostVO vo);
    int deletePostById(int id);
    PostVO selectPostById(int id);
    List<PostVO> selectPosts();
    List<PostVO> selectPostsByFilter(@Param("filter") String filter, @Param("value") String value);
}
