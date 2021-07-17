package com.hm.gongbang.dto;

import lombok.Data;

@Data
public class GongBang_FileDto {
	//공방 소개 첨부파일
	private int gf_addfilenum; //첨부파일 번호(기본키)
	private String gf_orgfilename; //원본파일 이름
	private String gf_savefilename; //저장파일 이름
	private int g_articlenum; //공방 글번호(외래키)
	private int wh_gbnum; //공방 번호(외래키)
}
