package com.munhwa.prj.withdraw.dto;

import lombok.Data;

@Data
public class CodeResponseDTO {
	private String code;
    private String scope;
    private String state;
}
