package com.munhwa.prj.wallet.vo;

import java.util.Date;

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
}
