package com.munhwa.prj.common.paging.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria {
	  
    private int pageNum; // 현재페이지
    private int amount; // 수량
    
    public Criteria() {
        this(1,10);
    }
 
    
    public Criteria(int pageNum, int amount) {
        this.pageNum = pageNum;
        this.amount = amount;
    }
}