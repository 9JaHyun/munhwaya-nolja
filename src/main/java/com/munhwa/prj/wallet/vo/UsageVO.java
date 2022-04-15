package com.munhwa.prj.wallet.vo;

import java.util.Date;

import com.munhwa.prj.common.entity.CommonCodeVO;
import com.munhwa.prj.music.vo.MusicVO;
import com.munhwa.prj.performance.vo.PerformanceVO;

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
	private String refund;
	
	private CommonCodeVO commonCodevo;
	private MusicVO musicvo;
	private PerformanceVO performancevo;
	
}
