package com.munhwa.prj.post.serviceImpl;

import com.munhwa.prj.post.mapper.PostMapper;
import com.munhwa.prj.post.service.PostService;
import com.munhwa.prj.post.vo.PostVO;
import java.util.List;
import java.util.Map;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Slf4j
@RequiredArgsConstructor
@Service
public class PostServiceImpl implements PostService {

    private final PostMapper mapper;

    @Override
    public int save(PostVO vo) {
        mapper.insertPost(vo);
        return vo.getId();
    }

    @Override
    public int update(PostVO vo) {
        return mapper.updatePost(vo);
    }

    @Override
    public int deleteById(int id) {
        return mapper.deletePostById(id);
    }

    @Override
    public int likeIt(Map<String, Object> paramMap) {
        return mapper.likeIt(paramMap);
    }

    @Override
    public PostVO findById(int id) {
        mapper.hitUpById(id);
        return mapper.selectPostById(id);
    }

    @Override
    public List<PostVO> findByFilter(String filter, String value, int pageNum, int amount) {
        return mapper.selectPostsByFilter(filter, value, pageNum, amount);
    }
}