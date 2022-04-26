package com.munhwa.prj.admin.web;

import com.munhwa.prj.artist.vo.PromotionRequestVO;
import java.util.Date;
import java.util.List;
import lombok.Data;

@Data
public class PromotionRequestDto {
    private int id;
    private String memberId;
    private String identify;
    private String artwork;
    private String status;
    private List<String> files;
    private Date createdAt;
    private Date updatedAt;

    public PromotionRequestDto() {
    }

    public PromotionRequestDto(PromotionRequestVO vo) {
        this.id = vo.getId();
        this.memberId = vo.getMemberId();
        this.identify = vo.getIdentify();
        this.artwork = vo.getArtwork();
        this.status = vo.getStatus();
        this.createdAt = vo.getCreatedAt();
        this.updatedAt = vo.getUpdatedAt();
    }
}
