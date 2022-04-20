package com.munhwa.prj.common.paging.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria {
	  
    private int pageNum;
    private int amount;
    
    private String keyword;
    
    private Criteria() {}
    
    public static Criteria ofNormal() {
        return new Criteria(1,10);
    }
    
    public static Criteria ofPerformance() {
    	return new Criteria(1,9);
    }
 
    public Criteria(int pageNum, int amount) {
        this.pageNum = pageNum;
        this.amount = amount;
    }
}