package com.hm.gongbang.dao;

import java.util.ArrayList;

import com.hm.gongbang.dto.MemberDto;
import com.hm.gongbang.dto.ReceptDto;


public interface MyDao {

	MemberDto memberInfo(String m_id);

	ArrayList<ReceptDto> receptList(String m_id);

}
