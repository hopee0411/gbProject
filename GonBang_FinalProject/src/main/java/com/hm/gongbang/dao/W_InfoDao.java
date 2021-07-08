package com.hm.gongbang.dao;

import org.springframework.stereotype.Repository;

import com.hm.gongbang.dto.WriterDto;

@Repository

public interface W_InfoDao {
	//작가 개인정보 불러오기
	//public void a_AtPrivateInfo(WriterDto writer);
	
	//작가 개인정보 수정하기
	//public void w_AtPrivateInfoFix(WriterDto writer);
	
	//작가 개인정보 불러오기
	public WriterDto w_AtPrivateInfoFix(String userId);
	
}
