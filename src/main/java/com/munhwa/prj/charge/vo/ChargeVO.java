package com.munhwa.prj.charge.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ChargeVO {
	private int id;
	private Date chargeAt;
	private int mileage;
	private String type;
	private String memberId;
}
