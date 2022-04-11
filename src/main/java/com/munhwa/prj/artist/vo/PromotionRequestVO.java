package com.munhwa.prj.artist.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PromotionRequestVO {
	private String memberId;
	private String identify;
	private String artwork;
	private String status;
	private String fileGroupId;
}
