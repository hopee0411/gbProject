package com.hm.gongbang.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.hm.gongbang.dto.ReceptDto;

@Repository

public interface W_DeliveryDao {

	// 작가 주문들어온 내역
	ArrayList<ReceptDto> receptList(String w_id);

	// 작가 주문 상품명 검색
	ArrayList<ReceptDto> receptPName(@Param("w_id") String w_id, @Param("r_pname") String r_pname);
	ArrayList<ReceptDto> receptPName1(ReceptDto rec);
	ArrayList<ReceptDto> receptPName2(ReceptDto rec);
	ArrayList<ReceptDto> receptPName3(ReceptDto rec);

	
	//작가 배송 준비 건수 출력
	int dwNumResult(String w_id);
	
	//작가 배송 완료 건수 출력
	int deNumResult(String w_id);
	
	//작가 운송장 번호 입력
	void dNumPut(ReceptDto rec);

}


