package com.munhwa.prj.withdraw.dto;

import lombok.Data;

@Data
public class AuthorizationRequestDto {

    private String client_id;
    private String scope;
    private String redirect_uri = "login inquiry transfer";
    private String auth_type = "0";
    private String response_type = "code";
    private String state = "b80BLsfigm9OokPTjy03elbJqRHOfGSY";
}
