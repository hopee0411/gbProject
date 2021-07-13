package com.hm.gongbang.dto;



import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class ReceptDto {
	private int r_num;
	private String r_pname;
	private int r_count;
	private int r_price;
	private String r_deliver;
	private String r_receive;
	private String r_phonenum;
	private String r_email;
	private int r_dprice;
	private String r_dmemo;
	private int r_point;
	private int r_addcode;
	private long r_refundnum;
	private String r_dcondition;
	private Timestamp r_orderdate;
	private int r_basketnum;
	private int o_optionnum;
	private String w_id;
	private String m_id;
	private String r_dnum;
	
}
