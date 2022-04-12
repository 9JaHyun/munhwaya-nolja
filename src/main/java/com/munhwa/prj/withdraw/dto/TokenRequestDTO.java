package com.munhwa.prj.withdraw.dto;

import lombok.Data;

@Data
public class TokenRequestDTO {
	 	//private String code;
	    private String clientId;
	    private String clientSecret;
	    private String scope;
	    //private String redirectUri;
	    private String grantType;

	    public TokenRequestDTO() {
	    }

	    public TokenRequestDTO(String client_id, String client_secret,
	          String scope, String grant_type) {
	        //this.code = code;
	        this.clientId = client_id;
	        this.clientSecret = client_secret;
	        this.scope = scope;
	        //this.redirectUri = redirect_uri;
	        this.grantType = grant_type;
	    }
}
