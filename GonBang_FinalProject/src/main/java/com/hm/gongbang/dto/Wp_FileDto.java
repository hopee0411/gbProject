package com.hm.gongbang.dto;

import lombok.Data;

@Data
public class Wp_FileDto {
	//작가 프로필
	public int wp_addfilenum; //첨부파일 번호 - 기본키
	public String wp_orgfilename; //원본파일 이름
	public String wp_savefilename; //저장파일 이름
	public String w_id; //작가 아이디 - 외래키
}
//시노님 : WP