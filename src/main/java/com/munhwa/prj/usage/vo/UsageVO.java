package com.munhwa.prj.usage.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class UsageVO {
	private int id;
	private Date useAt;
	private int mileage;
	private String place;
	private String memberId;
	private int pks;
}
