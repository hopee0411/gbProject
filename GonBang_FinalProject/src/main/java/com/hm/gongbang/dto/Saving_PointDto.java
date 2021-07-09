package com.hm.gongbang.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class Saving_PointDto {
	private Timestamp pt_pointdate;
	private String pt_pointhistory;
	private Timestamp pt_enddate;
	private int pt_point;
	private String m_id;
}
