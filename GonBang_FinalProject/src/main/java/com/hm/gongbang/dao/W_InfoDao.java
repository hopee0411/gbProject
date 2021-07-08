package com.hm.gongbang.dao;

import com.hm.gongbang.dto.WriterDto;

public interface W_InfoDao {
	//작가 개인정보 불러오기
	public void a_AtPrivateInfo(WriterDto writer);
	//작가 개인정보 수정하기
	public void w_AtPrivateInfoFix(WriterDto writer);
	
}
