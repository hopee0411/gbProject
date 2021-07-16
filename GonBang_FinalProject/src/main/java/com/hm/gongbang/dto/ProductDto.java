package com.hm.gongbang.dto;

import lombok.Data;

@Data
public class ProductDto {
	private int p_productnum; // 상품 번호(기본 키)
	private String p_headphto; // 대표 사진
	private String p_productname; // 제품 이름
	private String p_seolmyeong; // 설명
	private String p_seolphoto; // 설명 사진
	private String p_category; // 카테고리
	private int p_count; // 수량
	private int p_deliveryfee; // 배송료
	private int p_price; // 가격
	private int p_age; // 나이대
	private String p_gender; // 성별(남자/여자)
	private String p_couple; // 커플
	private String p_productjoin; // 작품 등록일
	private int p_gbnum; // 공방 번호
	private String p_dcompany; // 택배사
	private int p_views; // 조회수
	private int p_point; // 적립금(등급 별로 다름)
	private int p_stamptotal; // 찜 개수
	private String p_pdetail; // 작품 상세
	private String w_id; // 작가 아이디(외래키)
	// 공방 이름 추가 예정(....coming soon....)
}
