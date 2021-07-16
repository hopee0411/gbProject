package com.hm.gongbang.dto;

import lombok.Data;

@Data
public class CategoryDto {
	private String p_headphoto; // 제품 사진 
	private String wh_gbname; // 공방 이름
	private String p_productname; // 재품 아룸
	private int p_price; // 가격
	private String p_gender; // 성별
	private String p_couple; // 커플
	private int p_age; // 나이대
	private String p_category; // 카테고리
	private String w_id; // 작가 아이디
	private int p_productnum; // 제품 번호
	
}
