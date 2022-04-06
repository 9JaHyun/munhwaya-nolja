package com.munhwa.prj.charge.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.munhwa.prj.common.vo.CommonCodeVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ChargeVO {
	private int id;
	@DateTimeFormat(pattern="YYYY-MM-dd")
	private Date chargeAt;
	private int mileage;
	private String type;
	private String memberId;
	
	private CommonCodeVO commonCodevo;
}
