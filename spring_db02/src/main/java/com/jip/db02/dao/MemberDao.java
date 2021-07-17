package com.jip.db02.dao;

import com.jip.db02.dto.MemberDto;

public interface MemberDao {
	//회원가입용 insert - Create
	public void memberInsert(MemberDto member);
	//로그인 처리용 password 조회(select) - Read
	public String selectPass(String id);
	//회원 정보 보기용 조회 - Read
	public MemberDto selectMemberInfo(String id);	
	//회원 정보 변경 update - Update
	public void memberUpdate(MemberDto member);
	//회원 탈퇴 delete - Delete
	public void memberDelete(String id);
	
}
