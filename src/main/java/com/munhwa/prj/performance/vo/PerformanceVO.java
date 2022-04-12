package com.munhwa.prj.performance.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PerformanceVO {
	
	private int id;
	private String name;
	private String location;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
	private Date sdate;
	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
	private Date edate;
	private String content;
	private String status;
	private String image;
	private int artistId;
	private int price;
	private int person;
	private String artistName;

	
	public void accpetPerformance() {
		this.status = "A01";
	}
	
	public void rejectPerformance() {
		this.status = "A02";
	}
}
