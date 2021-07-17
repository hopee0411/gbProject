package com.webandapp.board.dto;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class ReplyDto {
	private int r_num;
	private int r_bnum; //게시글 번호 어느게시물의 해당되는 내용인지
	private String r_contents; //댓글 내용
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",
				timezone = "Asia/Seoul")
	private Timestamp r_date;
	private String r_id;
	//date 처리 시 json 객체로 변환할 때
	//시간값에 대한 출력 형식을 pattern으로 지정.
	//지역 시간(한국)을 적용하기 위해 timezone을 설정.
	//HH 는 24시간 기준 표기형식.
}
