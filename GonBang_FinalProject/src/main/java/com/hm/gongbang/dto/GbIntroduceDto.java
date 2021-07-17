package com.hm.gongbang.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class GbIntroduceDto {
//공방 소개 정보
	private int gbi_adddfilenum; //첨부파일 번호(GONBANG_FILE - 기본키)
	private String gbi_orgfilename; //원본파일 이름(GONBANG_FILE)
	private String gbi_savefilename; //저장파일 이름(GONBANG_FILE) - sys
	private int gbi_gbnum; //공방 번호(GONGBANG - 외래키)
	private int gbi_articlenum; //글번호(GONGBANG - 기본키)
	private Timestamp gbi_date; //날짜(GONGBANG)
	private String gbi_title; //제목(GONGBANG)
	private String gbi_contents; //내용(GONGBANG)
}