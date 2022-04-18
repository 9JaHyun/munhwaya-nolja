package com.munhwa.prj.withdraw.dto;

import lombok.Data;

@Data
public class TransferRequest {

    private int trans_no = 1;               // 거래 순번
    private String bank_tran_id;            // 은행 거래 고유 번호
    private String bank_code_std;           // 입금은행 표준코드
    private String account_num;             // 내계좌
    private String account_holder_name;     // 입금계좌 예금주명
    private String print_content;           // 입금계좌 인자내역
    private int tran_amt;                   // 거래 금액
    private String req_client_name;         // 요청고객성명
    private String req_client_num;          // 요청 고객 회원 번호
    private String transfer_purpose;        // 이체 용도
}
