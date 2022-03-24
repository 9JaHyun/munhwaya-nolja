package com.munhwa.prj.performance.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PerformanceVO {
	private int id;
	private String name;
	private String location;
	private Date sdate;
	private Date edate;
	private String content;
	private String status;
	private String image;
	private int artistId;
	private int price;
	private int person;
}
