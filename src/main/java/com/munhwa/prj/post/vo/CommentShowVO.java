package com.munhwa.prj.post.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import java.util.Date;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter @Setter
public class CommentShowVO {
    private int id;
    private String content;
    private int groupId;
    private int postId;
    private String memberId;
    private String writer;
    private String writerProfile;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
    private Date createdAt;
    private Date updatedAt;
    private int isGroup;
    private int groupOrder;
}
