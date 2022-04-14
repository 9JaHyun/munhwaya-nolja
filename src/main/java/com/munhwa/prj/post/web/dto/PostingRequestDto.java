package com.munhwa.prj.post.web.dto;

import com.munhwa.prj.post.vo.PostVO;
import java.util.Date;
import java.util.List;
import lombok.Getter;
import org.springframework.web.multipart.MultipartFile;

@Getter
public class PostingRequestDto {

    private String id;
    private String title;
    private String writer;
    private String content;
    private String memberId;
    private String fileGroupId;
    private List<MultipartFile> uploadFile;

    public PostVO toEntity() {
        return new PostVO(title, writer, content, new Date(), 0, 0, memberId, fileGroupId);
    }
}
