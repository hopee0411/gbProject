package com.hm.gongbang.dto;

import lombok.Data;

@Data
public class WriterDto {
	private String W_ID;
	private String W_PWD;
	private String W_PHONENUM;
	private String W_EMAIL;
	private int W_COMPANYNUM; //사업자 등록번호
	private String W_GENDER;
	private String W_BIRTH;
	private int W_ACCOUNT;
	private int W_NUMFAIL;// 로그인 실패횟수
	private int W_SELECTION;// 작가 세션값
	
	
}
