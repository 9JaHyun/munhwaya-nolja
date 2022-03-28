package com.munhwa.prj.ticketList.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class TicketListVO {
	private int id;
	private int performanceId;
	private String memberId;
	private String qrcode;
}
