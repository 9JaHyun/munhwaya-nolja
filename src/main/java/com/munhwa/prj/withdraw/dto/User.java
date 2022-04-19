package com.munhwa.prj.withdraw.dto;

import lombok.Getter;

@Getter
public class User {

    private String clientId;
    private String clientSecret;

    public User() {
        this.clientId = "12ce99f4-e774-4231-ab01-e287c5d279fc";
        this.clientSecret = "b45a8f6b-a958-4b21-8f7d-03f85c3e0214";
    }
}