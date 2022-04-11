package com.munhwa.prj.common.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class Criteria {
    private int pageNum;
    private int amount;
    private String keyword;

    /* 생성자 => 원하는 pageNum, 원하는 amount */
    public Criteria(int pageNum, int amount) {
        this.pageNum = pageNum;
        this.amount = amount;
    }

    public Criteria(int pageNum, int amount, String keyword) {
        this.pageNum = pageNum;
        this.amount = amount;
        this.keyword = keyword;
    }
}