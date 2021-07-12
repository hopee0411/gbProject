package com.hm.gongbang.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class QuestionDto {
	private int q_questionnum; // 문의번호
	private String q_contents; // 내용
	private String q_title; // 제목
	private String q_answer; //답변내용
	private String q_writedate; //작성일
	private String q_answerdate; //답변일
	private String q_condition; //상태(미확인 / 처리완료)
	private String w_id; // 작가 아이디
	private String m_id; // 회원 아이디
	private int p_productnum; //상품번호 
}