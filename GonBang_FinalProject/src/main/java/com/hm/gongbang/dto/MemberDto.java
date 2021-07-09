package com.hm.gongbang.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class MemberDto {
	private String m_id; //아이디
	private String m_pwd; // 비밀번호
	private String m_name; //이름
	private String m_email; //이메일
	private String m_addr; //주소
	private String m_gender; //성별
	private String m_birth; //생일
	private String m_grade; // 등급
	private Timestamp m_joinday;
	private int m_logfail;
	private int m_selection;
}
