package com.munhwa.prj.withdraw.dto;

import lombok.Data;

@Data
public class TokenRequestDTO {
	 	private String code;
	    private String clientId;
	    private String clientSecret;
	    private String redirectUri;
	    private String grantType;

	    public TokenRequestDTO() {
	    }

	    public TokenRequestDTO(String code, String client_id, String client_secret,
	          String redirect_uri, String grant_type) {
	        this.code = code;
	        this.clientId = client_id;
	        this.clientSecret = client_secret;
	        this.redirectUri = redirect_uri;
	        this.grantType = grant_type;
	    }
}