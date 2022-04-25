package com.munhwa.prj.post.web.dto;

import com.munhwa.prj.post.vo.PostVO;

public class PostUpdateRequestDto {

    private String title;
    private String content;

    public PostVO toEntity() {
        return new PostVO().updatePost(title, content);
    }
}
