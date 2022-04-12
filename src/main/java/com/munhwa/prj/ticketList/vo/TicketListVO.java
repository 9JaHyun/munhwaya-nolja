package com.munhwa.prj.ticketList.vo;

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
}


