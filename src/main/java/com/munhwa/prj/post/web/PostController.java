package com.munhwa.prj.post.web;

import com.munhwa.prj.common.entity.UploadFile;
import com.munhwa.prj.common.service.FileUtils;
import com.munhwa.prj.common.service.UploadFileService;
import com.munhwa.prj.config.auth.LoginUser;
import com.munhwa.prj.config.auth.dto.SessionUser;
import com.munhwa.prj.post.service.PostService;
import com.munhwa.prj.post.vo.PostVO;
import com.munhwa.prj.post.web.dto.PostUpdateRequestDto;
import com.munhwa.prj.post.web.dto.PostingRequestDto;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Slf4j
@RequiredArgsConstructor
@Controller
public class PostController {

    private final PostService postService;
    private final UploadFileService uploadFileService;
    private final FileUtils fileUtils;

    @GetMapping("/post")
    public String showPost(Model model, int id) {
        model.addAttribute("post", postService.findById(id));
        return "post/post";
    }

    @GetMapping("/posts")
    public String findAll(
          @RequestParam(name = "key", defaultValue = "no") String key,
          @RequestParam(name = "value", defaultValue = "") String value,
          @RequestParam(name = "pageNum", defaultValue = "1") int pageNum,
          @RequestParam(name = "amount", defaultValue = "10") int amount, Model model) {
        model.addAttribute("posts", postService.findByFilter(key, value, pageNum, amount));

        return "post/postList";
    }

    @GetMapping("/posting")
    public String postingForm() {
        return "post/postingForm";
    }

    @GetMapping("/postingTest")
    public void posting(@LoginUser SessionUser user) {
        PostVO postVO = new PostVO();
        postVO.setTitle("title");
        postVO.setMemberId(user.getId());
        postVO.setContent("123");
        postVO.setWriter(user.getNickname());
        postService.save(postVO);
    }

    @PostMapping("/posting")
    public String posting(PostingRequestDto dto) throws IOException {
        List<MultipartFile> files = dto.getUploadFile();
        PostVO post = dto.toEntity();
        int postId = postService.save(post);
        if (files != null && files.size() != 0) {
            List<UploadFile> uploadFiles = fileUtils.storeFiles(files);
            uploadFiles.forEach(uploadFile -> {
                uploadFileService.save(uploadFile, "post", postId);
            });
        }
        PostVO postVO = dto.toEntity();

        return "post/postList";
    }

    @GetMapping("/updatePost")
    public String updatePostForm(int postId, Model model) {
        model.addAttribute(postService.findById(postId));
        return "post/postUpdateForm";
    }

    @PostMapping("/updatePost")
    public String updatePost(PostUpdateRequestDto dto) {
        postService.update(dto.toEntity());
        return "post/post";
    }

    @PostMapping("/delPost")
    public String deletePost(int postId) {
        int result = postService.deleteById(postId);
        if (result == 1) {
            return "redirect:posts";
        } else {
            return "post";
        }
    }

    @PostMapping("/likePost")
    public void likePost(@LoginUser SessionUser user, int postId) {
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("v_post_id", postId);
        paramMap.put("v_member_id", user.getId());

        postService.likeIt(paramMap);
    }
}