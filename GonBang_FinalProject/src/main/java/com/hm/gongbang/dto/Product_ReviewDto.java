package com.hm.gongbang.dto;

import lombok.Data;

@Data
public class Product_ReviewDto {
	//상품 구매 후기
	private int pr_articlenum; //글번호 - 기본키
	private String pr_title; //제목
	private String pr_contents; //내용
	private String pr_date; //날짜(년/월/일 시간(시/분/초)
	private String pr_image; //이미지
	private int pr_scope; //별점
	private int p_productnum; //상품번호 - 외래키
	private String m_id; //회원 아이디 - 외래키
}
//시노님 : PR