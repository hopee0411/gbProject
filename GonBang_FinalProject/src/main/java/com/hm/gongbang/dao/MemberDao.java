package com.hm.gongbang.dao;

import java.util.ArrayList;

import com.hm.gongbang.dto.MemberDto;
import com.hm.gongbang.dto.Mw_viewDto;
import com.hm.gongbang.dto.Shopping_BasketDto;

public interface MemberDao {
	//로그인	
	public Mw_viewDto loginProc(String mw_id);
	//아이디 중복 확인	
	public int idCheck(String id);
	//일반 회원 가입
	public void memberJoinProc(MemberDto member);
	//장바구니
	public ArrayList<Shopping_BasketDto> getBasket(String m_id);


}//class end
