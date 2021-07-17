package com.webandapp.board.dto;

import lombok.Data;

@Data
public class MemberDto {
	//컬럼명과 똑같이 넣기(소문자로)
	private String m_id;
	private String m_pwd;
	private String m_name;
	private String m_birth;
	private String m_addr;
	private String m_phone;
	private int m_point;
	private String g_name; //등급
}