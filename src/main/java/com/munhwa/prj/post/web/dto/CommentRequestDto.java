package com.munhwa.prj.post.web.dto;

import com.munhwa.prj.post.vo.CommentVO;
import lombok.Data;

@Data
public class CommentRequestDto {
    private String content;
    private int groupId;
    private int postId;

    public CommentVO toEntity(String memberId) {
        return new CommentVO(content, groupId, postId, memberId);
    }

}
