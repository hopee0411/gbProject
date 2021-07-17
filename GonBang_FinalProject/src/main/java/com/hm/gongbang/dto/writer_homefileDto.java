package com.hm.gongbang.dto;

import lombok.Data;

@Data
public class writer_homefileDto {
	private int whf_gbnum; //공방번호(WRITER_HOME - 기본키)
	private String whf_gbname; //공방이름(WRITER_HOME)
	private String whf_memo; //메모(WRITER_HOME)
	private String whf_w_id; //작가아이디(외래키)(WRITER_HOME)
	private int whf_addfilenum; //첨부파일 번호(WP_FILE - 기본 키)
	private String whf_orgfilename; //원본파일이름(WP_FILE)
	private String whf_savefilename; //저장파일이름(WP_FILE)
}
