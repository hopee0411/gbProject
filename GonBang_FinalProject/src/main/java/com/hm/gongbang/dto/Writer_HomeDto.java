package com.hm.gongbang.dto;

import lombok.Data;

@Data
public class Writer_HomeDto {
	private int wh_gbnum; //공방번호 - 기본키
	private String wh_gbname; //공방이름
	private String wh_memo; //메모
	private String w_id; //작가 아이디 - 외래키
}