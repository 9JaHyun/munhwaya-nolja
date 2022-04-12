package com.munhwa.prj.post.web;

import com.munhwa.prj.post.service.PostService;
import com.munhwa.prj.post.vo.PostVO;
import java.util.List;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RequiredArgsConstructor
@RestController
public class PostController {

    private final PostService postService;

    @GetMapping("/post")
    public String findAll() {
        List<PostVO> list = postService.findAll();
        return list.toString();
    }

    @GetMapping("/post/{id}")
    public String findById(@PathVariable int id) {
        return postService.findById(id).toString();
    }

    @GetMapping("/post/{key}/{value}")
    public String findByFilter(@PathVariable String key, @PathVariable String value) {
        List<PostVO> list = postService.findByFilter(key, value);
        return list.toString();
    }
}
