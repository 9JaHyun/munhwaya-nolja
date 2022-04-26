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

    public PostVO updatePost(int id, String title, String content, String fileGroupId) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.fileGroupId = fileGroupId;
        return this;
    }
    public PostVO(String title, String content, Date createdAt, int hit, int likeIt) {
        this.title = title;
        this.content = content;
        this.createdAt = createdAt;
        this.hit = hit;
        this.likeIt = likeIt;
    }
}
