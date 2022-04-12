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
}
