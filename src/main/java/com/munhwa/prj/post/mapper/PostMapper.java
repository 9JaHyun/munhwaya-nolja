package com.munhwa.prj.post.mapper;

import com.munhwa.prj.post.vo.PostVO;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Param;

public interface PostMapper {

    int insertPost(PostVO vo);

    int updatePost(PostVO vo);

    int deletePostById(int id);

    int hitUpById(int id);

    PostVO selectPostById(int id);

    List<PostVO> selectPosts();

    List<PostVO> selectPostsByFilter(@Param("key") String key, @Param("value") String value
          , @Param("pageNum") int pageNum, @Param("amount") int amount);

    int likeIt(Map<String, Object> paramMap);
}
