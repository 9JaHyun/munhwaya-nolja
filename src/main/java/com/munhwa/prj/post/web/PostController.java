package com.munhwa.prj.post.web;

import com.munhwa.prj.post.service.PostService;
import com.munhwa.prj.post.vo.PostVO;
import java.util.List;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

@Slf4j
@RequiredArgsConstructor
@Controller
public class PostController {

    private final PostService postService;

    @GetMapping("/posts")
    public String findAll(@RequestParam(name = "filter", defaultValue = "no") String filter,
          @RequestParam(name = "value", defaultValue = "") String value,
          @RequestParam(name = "pageNum", defaultValue = "1") String pageNum,
          @RequestParam(name = "amount", defaultValue = "10") String amount, Model model) {
        model.addAttribute("posts", postService.findByFilter(filter, value));

        return "post/postList";
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