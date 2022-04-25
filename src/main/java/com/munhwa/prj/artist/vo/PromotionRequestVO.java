package com.munhwa.prj.artist.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PromotionRequestVO {
	private int id;
	private String memberId;
	private String identify;
	private String artwork;
	private String status;
	private String fileGroupId;
	private Date createdAt;
	private Date updatedAt;
	
	public PromotionRequestVO() {
	}
	public PromotionRequestVO(String memberId, String identify, String artwork, String status, String fileGroupId,
			Date createdAt, Date updatedAt) {
		super();
		this.memberId = memberId;
		this.identify = identify;
		this.artwork = artwork;
		this.status = status;
		this.fileGroupId = fileGroupId;
		this.createdAt = createdAt;
		this.updatedAt = updatedAt;
	}
	
	
}
