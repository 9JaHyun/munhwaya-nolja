package com.munhwa.prj.withdraw.dto;

import lombok.Data;

@Data
public class CodeRequestDTO {
		private String responseType;
	    private String clientId;
	    private String redirectUrl;
	    private String scope;
	    private String state;
	    private String authType;
}
