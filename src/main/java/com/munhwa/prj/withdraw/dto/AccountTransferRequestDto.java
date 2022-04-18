package com.munhwa.prj.withdraw.dto;

import java.util.List;
import lombok.Data;

@Data
public class AccountTransferRequestDto {
    private String bank_tran_id;                    //M202111920+U+랜덤숫자 9 자리
    private String cntr_account_type = "N"          //n  약정 계좌/계정 구분주2)  n:계좌, c:계정
    private String cntr_account_num;                //약정 계좌/계정 번호주2) 내계좌
    private String wd_print_content;                //입금계좌인자내역
    private String name_check_option = "on";
    private String tran_amt;                        //거래금액
    private String tran_dtime;                      // 요청 일시
    private int req_cnt = 1;                        // 입금 요청 건수
    private TransferRequest req_list;         // 요청 목록

    public AccountTransferRequestDto(String bank_tran_id,String fintech_use_num, String req_client_name, String cntr_account_num, String req_client_account_num){
        this.bank_tran_id = bank_tran_id;
        this.fintech_use_num = fintech_use_num;
        this.req_client_name = req_client_name;
        this.cntr_account_num = cntr_account_num;
        this.req_client_account_num = req_client_account_num;
    }
}
