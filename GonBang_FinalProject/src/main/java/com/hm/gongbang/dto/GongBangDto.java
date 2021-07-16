package com.hm.gongbang.dto;

import lombok.Data;
import java.sql.Timestamp; //yyyy/MM/dd hh:mm:dd 형식의 날짜 데이터 저장 타입.

@Data
public class GongBangDto {
	//공방 소개
	private int g_articlenum; //글번호 - 기본키
	private String g_title; //제목
	private String g_coutents; //내용
	private int wh_gbnum; //공방 번호 -외래키
	private Timestamp g_date; //오라클의 date 타입과 연동이 잘되는 자료형.
}
//시노님 : G