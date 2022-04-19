package com.munhwa.prj.news.event.entity;

import lombok.Data;

@Data
public class PromotionRequestEvent {
	private int memberId;
    
    public PromotionRequestEvent(int memberId) {
    	this.memberId = memberId;
    }
    
}
