package com.munhwa.prj.ticketList.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.munhwa.prj.performance.vo.PerformanceVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class TicketListVO {
	private int id;
	private int performanceId;
	private String memberId;
	private String qrcode;
	private PerformanceVO performancevo;
	private String attendance;
	private int person;
	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
	private Date time;
}


