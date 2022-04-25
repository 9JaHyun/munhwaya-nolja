package com.munhwa.prj.artist.web;

import java.util.Date;

import com.munhwa.prj.artist.vo.ArtistVO;
import com.munhwa.prj.artist.vo.PromotionRequestVO;

public class PromotionRequestDTO {
	private String memberId;
	private String identify;
	private String artwork;
	private String status;
	private String fileGroupId;
	private Date createdAt;
	private Date updatedAt;
	
	public PromotionRequestVO toEntity() {
		return new PromotionRequestVO(memberId, identify, artwork, status, fileGroupId, createdAt, updatedAt);
	}
}
