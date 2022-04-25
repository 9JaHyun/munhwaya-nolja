package com.munhwa.prj.post.web.dto;

import com.munhwa.prj.post.vo.PostVO;
import java.util.Date;
import java.util.List;
import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

@Data
public class PostingRequestDto {

    private String title;
    private String content;
    private List<MultipartFile> files;

    public PostVO toEntity() {
        return new PostVO(title, content, new Date(), 0, 0);
    }
}
