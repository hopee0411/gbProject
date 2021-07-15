package com.hm.gongbang.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.hm.gongbang.dto.ReceptDto;

@Repository

public interface W_DeliveryDao {

	// 작가 주문들어온 내역
	ArrayList<ReceptDto> receptList(String w_id);

	// 작가 주문 검색 옵션
	ArrayList<ReceptDto> receptPName(@Param("w_id") String w_id, @Param("r_pname") String r_pname);
	
	// 실패  ArrayList<ReceptDto> receptPName(@Param("w_id") String w_id, @Param("r_pname") String r_pname);
	

}
