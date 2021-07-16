package com.hm.gongbang.dto;

import javax.swing.Spring;

import lombok.Data;

@Data
public class OpptionDto {
	private int	o_optionnum; // 옵션 번호(기본 키)
	private String  o_optionname; // 옵션명
	private int   o_optionprice; // 옵션 가격
	private int o_optionstock; // 옵션 재고
	private int p_productnum; //상품 번호(외래 키)

}
