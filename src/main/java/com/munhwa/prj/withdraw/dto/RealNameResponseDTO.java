package com.munhwa.prj.withdraw.dto;

import lombok.Data;

@Data
public class RealNameResponseDTO {
	private String api_tran_id;
	private String api_tran_dtm;
	private String rsp_code;
	private String rsp_message;
	private String bank_tran_id;
	private String bank_code_tran;
	private String bank_rsp_code;
	private String bank_rsp_message;
	private String bank_code_std;
	private String bank_code_sub;
	private String bank_name;
	private String saving_bank_name;
	private String account_num;
	private String aacount_seq;
	private String account_holder_info_type;
	private String account_holder_info;
	private String account_holder_name;
	private String account_type;
}
