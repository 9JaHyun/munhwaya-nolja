package com.munhwa.prj.withdraw.dto;

import lombok.Data;

@Data
public class RealNameRequestDTO {
	private String authorization;
	private String bankTranId;
	private String bankCodeStd;
	private String accountNum;
	private String accountHolderInfoType;
	private String tranDtime;
}
