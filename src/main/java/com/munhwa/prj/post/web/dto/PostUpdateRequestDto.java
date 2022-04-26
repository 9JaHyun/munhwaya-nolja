package com.munhwa.prj.post.web.dto;

import com.munhwa.prj.post.vo.PostVO;

public class PostUpdateRequestDto {

    private int id;
    private String title;
    private String content;
    private String fileGroupId;

    public PostVO toEntity() {
        return new PostVO().updatePost(id, title, content, fileGroupId);
    }

}
