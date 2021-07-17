package com.jip.db02.dto;

import lombok.Data;

@Data
public class MemberDto {
	//이 DTO로 로그인, 회원가입 데이터 저장을 처리
	private String m_id;
	private String m_pass;
	private String m_name;
	private String m_phone;
}
