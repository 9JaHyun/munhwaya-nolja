package com.munhwa.prj.wallet.vo;

import java.util.Date;

import com.munhwa.prj.common.vo.CommonCodeVO;
import com.munhwa.prj.music.vo.MusicVO;
import com.munhwa.prj.performance.vo.PerformanceVO;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class ProfitVO {
	private int id;
	private Date profitAt;
	private int mileage;
	private String place;
	private String memberId;
	private int pks;
	private String refund;
	private String buyer;
	
	private CommonCodeVO commonCodevo;
	private MusicVO musicvo;
	private ArtistVO artistvo;
	private PerformanceVO performancevo;
	
	public ProfitVO() {
		
	}
	
}
