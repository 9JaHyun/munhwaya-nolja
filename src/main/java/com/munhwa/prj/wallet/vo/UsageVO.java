package com.munhwa.prj.wallet.vo;

import java.util.Date;
import java.util.List;

import com.munhwa.prj.common.vo.CommonCodeVO;

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
	
	private CommonCodeVO commonCodevo;
}
