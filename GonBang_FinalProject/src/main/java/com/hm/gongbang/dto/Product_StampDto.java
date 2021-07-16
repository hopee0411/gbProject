package com.hm.gongbang.dto;

import lombok.Data;

@Data
public class Product_StampDto {
	private int ps_stampnum; // 찜 번호(기본 키)
	private int p_productnum; // 상품 번호(외래 키)
	private String m_id; // 회원 아이디(외래 키)
}
