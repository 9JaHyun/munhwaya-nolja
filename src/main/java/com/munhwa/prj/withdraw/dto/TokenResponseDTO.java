package com.munhwa.prj.withdraw.dto;

import lombok.Data;

@Data
public class TokenResponseDTO {
    private String access_token;
    private String token_type;
    private String expires_in;
    private String refresh_token;
    private String scope;
    private String user_seq_no;
}
