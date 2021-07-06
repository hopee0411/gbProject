package com.hm.gongbang.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class MemberDto {
	private String m_id;
	private String m_pwd;
	private String m_name;
	private String m_email;
	private String m_addr;
	private String m_gender;
	private String m_birth;
	private String m_grade;
	private Timestamp m_joinday;
	private int m_logfail;
	private int m_selection;
}
