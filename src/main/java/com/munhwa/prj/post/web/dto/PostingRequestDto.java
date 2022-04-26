package com.munhwa.prj.post.web.dto;

import com.munhwa.prj.post.vo.PostVO;
import java.util.Date;
import lombok.Data;

@Data
public class PostingRequestDto {

    private String title;
    private String content;

    public PostVO toEntity() {
        return new PostVO(title, content, new Date(), 0, 0);
    }
}
