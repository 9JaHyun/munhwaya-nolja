package com.munhwa.prj.post.vo;

import java.util.Date;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter @Setter
public class PostVO {

    private int id;
    private String title;
    private String writer;
    private String content;
    private Date createdAt;
    private int hit;
    private int likeIt;
    private String memberId;
    private String fileGroupId;

    public PostVO() { }

    public PostVO updatePost(String title, String content) {
        this.title = title;
        this.content = content;
        return this;
    }

    public PostVO(String title, String writer, String content, Date createdAt, int hit, int likeIt,
          String memberId, String fileGroupId) {
        this.title = title;
        this.writer = writer;
        this.content = content;
        this.createdAt = createdAt;
        this.hit = hit;
        this.likeIt = likeIt;
        this.memberId = memberId;
        this.fileGroupId = fileGroupId;
    }
}
