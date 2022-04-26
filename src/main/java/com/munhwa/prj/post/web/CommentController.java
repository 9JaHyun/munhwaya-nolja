package com.munhwa.prj.post.web;

import com.munhwa.prj.config.auth.LoginUser;
import com.munhwa.prj.config.auth.entity.SessionUser;
import com.munhwa.prj.post.service.CommentService;
import com.munhwa.prj.post.vo.CommentShowVO;
import com.munhwa.prj.post.vo.CommentVO;
import com.munhwa.prj.post.web.dto.CommentRequestDto;
import java.util.List;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RequiredArgsConstructor
@RestController
public class CommentController {

    private final CommentService commentService;

    @GetMapping("/comment")
    public List<CommentShowVO> showAllComments(int id) {
        List<CommentShowVO> byPostId = commentService.findByPostId(id);
        return byPostId;
    }

    @PostMapping("/comment")
    public ResponseEntity<String> comment(@LoginUser SessionUser user, CommentRequestDto dto) {
        CommentVO comment = dto.toEntity(user.getId());
        int result = commentService.save(comment);
        if (result == 0) {
            return ResponseEntity.badRequest().body("잘못된 요청입니다.");
        }
        return ResponseEntity.ok().body("입력 성공");
    }

    @PostMapping("/updateComment")
    public ResponseEntity<String> updatePost(CommentVO comment) {
        int result = commentService.update(comment);

        if (result == 0) {
            return ResponseEntity.badRequest().body("잘못된 요청입니다.");
        }
        return ResponseEntity.ok().body("입력 성공");
    }

    @PostMapping("/deleteComment")
    public ResponseEntity<String> deletePost(int commentId) {
        int result = commentService.deleteById(commentId);

        if (result == 0) {
            return ResponseEntity.badRequest().body("잘못된 요청입니다.");
        }
        return ResponseEntity.ok().body("삭제 성공");
    }
}