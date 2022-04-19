package com.munhwa.prj.withdraw.dto;

import lombok.Data;

@Data
public class AccountTransferRequestDto {

    private String bank_tran_id;                    //M202111920+U+랜덤숫자 9 자리
    private String cntr_account_type = "N";         // n:계좌, c:계정
    private String cntr_account_num;
    private String wd_pass_phrase = "NONE";
    private String wd_print_content;
    private String name_check_option = "on";
    private String tran_dtime;
    private int req_cnt = 1;                        // 입금 요청 건수
    private TransferRequest req_list;               // 요청 목록

    public AccountTransferRequestDto(String bank_tran_id, String cntr_account_num, String wd_print_content,
          TransferRequest req_list) {
        this.bank_tran_id = bank_tran_id;
        this.cntr_account_num = cntr_account_num;
        this.tran_dtime = tran_dtime;
        this.wd_print_content = wd_print_content;
        this.req_list = req_list;
    }


}
