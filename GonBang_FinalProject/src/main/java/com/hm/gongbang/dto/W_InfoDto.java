package com.hm.gongbang.dto;

import lombok.Data;

@Data

public class W_InfoDto {

	private String wh_gbname;
	private String w_id;
	private String w_pwd;
	private String w_phonenum;
	private String w_email;
	private int w_companynum; //사업자 등록번호
	private String w_gender;
	private String w_birth;
	private String w_addr;
	private int w_account;
	
	
}
