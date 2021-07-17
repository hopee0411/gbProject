package com.hm.gongbang.dao;

import java.util.Map;

import com.hm.gongbang.dto.GbIntroduceDto;
import com.hm.gongbang.dto.writer_homefileDto;

public interface Writer_HomeDao {

	//공방 사이드 사진, 이름, 메모
	public writer_homefileDto getgbNM(Integer whf_gbnum);
	
	//공방 소개 홈 정보출력
	public GbIntroduceDto getGBI(Integer whf_gbnum);

	//공방 소개 수정 정보 출력-----????
	//public GbIntroduceDto writergbi(Integer gbi_gbnum);
	
	//공방 소개 수정버튼 클릭
	public void handmadeItdInUpdate(GbIntroduceDto gbi, Integer gbnum);

	//공방 소개 사진 저장
	public void fileInsert(Map<String, String> fmap);
}
