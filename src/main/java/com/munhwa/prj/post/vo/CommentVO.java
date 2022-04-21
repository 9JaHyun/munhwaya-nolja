package com.munhwa.prj.post.vo;

import java.util.Date;
import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class CommentVO {

    private int id;
    private String content;
    private int groupId;
    private int postId;
    private String memberId;
    private Date createdAt;
    private Date updatedAt;

    public CommentVO() {
    }

    public CommentVO(String content, int groupId, int postId, String memberId) {
        this.content = content;
        this.groupId = groupId;
        this.createdAt = new Date();
        this.postId = postId;
        this.memberId = memberId;
    }
}
