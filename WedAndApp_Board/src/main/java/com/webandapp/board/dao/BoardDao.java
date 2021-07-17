package com.webandapp.board.dao;

import java.util.List;
import java.util.Map;

import com.webandapp.board.dto.BfileDto;
import com.webandapp.board.dto.BoardDto;
import com.webandapp.board.dto.ReplyDto;

public interface BoardDao {

	//게시글 목록 가져오기
	List<BoardDto> getList(int num);

	//전체 글개수 구하기
	int getBoardCnt();

	//게시글 저장
	void boardInsert(BoardDto board);

	//파일 정보 저장
	void fileInsert(Map<String, String> fmap);

	//게시글 내용 가져오기
	BoardDto getContents(Integer bnum);

	//게시글 파일 목록 가져오기
	List<BfileDto> getBfList(Integer bnum);

	//게시글 댓글 목록 가져오기
	List<ReplyDto> getReList(Integer bnum);

	//댓글 저장
	void replyInsert(ReplyDto reply);
}