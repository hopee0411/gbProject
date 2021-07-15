package com.hm.gongbang.dto;

import lombok.Data;

@Data
public class Shopping_BasketDto {
	private int sb_basketnum;
	private int sb_totalprice;
	private int sb_count;
	private String sb_optionname;
	private int sb_optionprice;
	private int sb_oprionstock;
	private String m_id;
	private int p_productnum;
}//class end
