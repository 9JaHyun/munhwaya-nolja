package com.munhwa.prj.common.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AmountChangeRequestDTO {
	private String memberId;
	private int amount;
}
