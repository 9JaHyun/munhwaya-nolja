package com.munhwa.prj.post.web;

import com.munhwa.prj.common.file.entity.UploadFile;
import com.munhwa.prj.common.file.entity.UploadFileVO;
import com.munhwa.prj.common.file.service.FileUtils;
import com.munhwa.prj.common.file.service.UploadFileService;
import com.munhwa.prj.config.auth.LoginUser;
import com.munhwa.prj.config.auth.entity.SessionUser;
import com.munhwa.prj.post.service.PostService;
import com.munhwa.prj.post.vo.PostVO;
import com.munhwa.prj.post.web.dto.PostUpdateRequestDto;
import com.munhwa.prj.post.web.dto.PostingRequestDto;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.atomic.AtomicReference;
import java.util.stream.Collectors;
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
    public String showPost(@LoginUser SessionUser user, Model model, int id) {
        PostVO post = postService.findById(id);
        if (post.getFileGroupId() != null) {
            List<String> picture = uploadFileService.findByGroupId(post.getFileGroupId()).stream()
                  .map(UploadFileVO::getSname)
                  .collect(Collectors.toList());
            model.addAttribute("pictures", picture);
        }
        model.addAttribute("post", post);
        return "post/post";
    }

    @GetMapping("/posts")
    public String findAll(
          @RequestParam(name = "key", defaultValue = "no") String key,
          @RequestParam(name = "value", defaultValue = "") String value,
          @RequestParam(name = "pageNum", defaultValue = "1") int pageNum,
          @RequestParam(name = "amount", defaultValue = "10") int amount, Model model) {
        model.addAttribute("posts", postService.findByFilter(key, value, pageNum, amount));
        model.addAttribute("now", new Date());

        return "post/postList";
    }

    @GetMapping("/posting")
    public String postingForm() {
        return "post/postingForm";
    }

    @PostMapping("/posting")
    public String posting(@LoginUser SessionUser user, PostingRequestDto dto, List<MultipartFile> files)throws IOException {
        PostVO post = dto.toEntity();

        post.setWriter(user.getNickname());
        post.setMemberId(user.getId());
        post.setCreatedAt(new Date());

        int postId = postService.save(post);
        if (files.size() > 0) {
            AtomicReference<String> fileGroupId = new AtomicReference<>();
            List<UploadFile> uploadFiles = fileUtils.storeFiles(files);
            uploadFiles.forEach(uploadFile -> {
                fileGroupId.set(uploadFileService.save(uploadFile, "post", postId));
            });
            post.setFileGroupId(fileGroupId.get());
            postService.update(post);
        }
        return "redirect:posts";
    }

    @GetMapping("/updatePost")
    public String updatePostForm(int postId, Model model) {
        model.addAttribute("post", postService.findById(postId));
        return "post/postUpdateForm";
    }

    @PostMapping("/updatePost")
    public String updatePost(PostUpdateRequestDto dto, List<MultipartFile> files)
          throws IOException {
        PostVO postVO = dto.toEntity();
        
        if (files.size() > 0) {
            if (!postVO.getFileGroupId().isEmpty() && !postVO.getFileGroupId().isBlank()) {
                uploadFileService.deleteByGroupId(postVO.getFileGroupId());
            }
            AtomicReference<String> fileGroupId = new AtomicReference<>();
            List<UploadFile> uploadFiles = fileUtils.storeFiles(files);
            uploadFiles.forEach(uploadFile -> {
                fileGroupId.set(uploadFileService.save(uploadFile, "post", postVO.getId()));
            });
            postVO.setFileGroupId(fileGroupId.get());

            postService.update(postVO);
        }
        
        postService.update(dto.toEntity());
        return "post/post";
    }

    @PostMapping("/delPost")
    public String deletePost(PostDeleteRequestDto dto) {
        int result = postService.deleteById(dto.getId());
        if (result == 1) {
            if (!dto.getGroupId().isEmpty() && !dto.getGroupId().isBlank()) {
                uploadFileService.deleteByGroupId(dto.getGroupId());
            }
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