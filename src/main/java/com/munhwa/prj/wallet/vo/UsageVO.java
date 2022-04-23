package com.munhwa.prj.wallet.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.munhwa.prj.common.code.entity.CommonCodeVO;
import com.munhwa.prj.music.vo.MusicVO;
import com.munhwa.prj.performance.vo.PerformancePersonalVO;
import com.munhwa.prj.performance.vo.PerformanceVO;
import com.munhwa.prj.ticketList.vo.TicketListVO;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class UsageVO {
	private int id;
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+9")
	private Date useAt;
	private int mileage;
	private String place;
	private String memberId;
	private int pks;
	private String refund;
	private String usageIds;
	private String name;
	
	private CommonCodeVO commonCodevo;
	private MusicVO musicvo;
	private PerformanceVO performancevo;
	private TicketListVO ticketListvo;
	private PerformancePersonalVO performancePersonalvo;
}
