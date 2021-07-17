package com.webandapp.board.dao;

import com.webandapp.board.dto.MemberDto;

public interface MemberDao {

	//회원 가입
	public void memInsert(MemberDto member);
	
	//아이디 중복 체크
	//mid : 컨트롤러의 매개변수로 들어가있는것 사용
	public int idCheck(String mid);

	//해당 아이디로 비밀번호 검색
	//m_id : Dto 필드명
	public String selectPwd(String m_id);

	//로그인 회원 정보 검색
	public MemberDto memberSelect(String m_id);
	
}
