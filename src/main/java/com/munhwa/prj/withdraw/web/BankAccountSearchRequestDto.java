package com.munhwa.prj.withdraw.web;

import com.munhwa.prj.withdraw.dto.BankTokenResponseDto;
import lombok.Data;

@Data
public class BankAccountSearchRequestDto {
    private String access_token;
    private String user_seq_no;
    private String include_cancel_yn;
    private String sort_order;
    private String model;

    public BankAccountSearchRequestDto createDtoByToken(BankTokenResponseDto token) {
        this.access_token = token.getAccess_token();
        this.user_seq_no = token.getUser_seq_no();
        this.include_cancel_yn = "N";
        this.sort_order = "D";
        return this;
    }
}
