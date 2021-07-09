package com.hm.gongbang.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class CouponDto {
	private Timestamp c_coupondate;
	private int c_couponhistory;
	private Timestamp c_enddate;
	private String m_id;
}
