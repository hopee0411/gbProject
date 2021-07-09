package com.hm.gongbang.dto;

import lombok.Data;

@Data
public class WriterDto {
	private String w_id;
	private String w_pwd;
	private String w_phonenum;
	private String w_email;
	private int w_companynum; //사업자 등록번호
	private String w_gender;
	private String w_birth;
	private int w_account;
	private int w_numfail;// 로그인 실패횟수
	private int w_selection;// 작가 세션값
	
	
}
