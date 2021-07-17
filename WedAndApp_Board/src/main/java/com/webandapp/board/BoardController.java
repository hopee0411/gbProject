package com.webandapp.board;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.webandapp.board.dto.BfileDto;
import com.webandapp.board.dto.ReplyDto;
import com.webandapp.board.service.BoardService;

import lombok.extern.java.Log;

@Controller
@Log
public class BoardController {
	//서비스 객체 변수
	@Autowired
	private BoardService bServ;
	
	private ModelAndView mv;
	
	//이게 게시물 페이지 넘기는 숫자바인가?
	@GetMapping("list")
	public ModelAndView boardList(Integer pageNum) {
		//Integer pageNum은 페이지 번호를 받는 변수
		//사용자가 목록에서 페이지를 변경하면 해당 페이지 번호를 받는다.
		
		log.info("boardList()");
		
		//DB를 조회하여 페이지 번호에 해당하는 게시글 목록을 
		//model에 저장하는 서비스 메소드 실행.
		mv = bServ.getBoardList(pageNum);
		
		return mv;
	}
	
	@GetMapping("writeFrm")
	public String writeFrm() {
		//log를 반드시 할 필요는 없다.
		//나중에 유지보수를 위해 필요하다고 생각하면 넣어준다.
		log.info("writeFrm()");
		
		return "writeFrm";
	}
	
	//멀티파트 데이터를 처리할 경우 첫번째 파라미터는 MultipartHttpServletRequest를 사용
	@PostMapping("WriteProc")
	public String WriteProc(MultipartHttpServletRequest multi,
			RedirectAttributes rttr) {
		log.info("WriteProc()");
		
		String view = bServ.boardInsert(multi, rttr);
		
		return view;
	}
	
	@GetMapping("contents")
	public ModelAndView boardContents(Integer bnum) {
		log.info("boardContents() - bnum : " + bnum);
		
		//ModelAndView에 보여질 데이터를 담고 이동할 페이지를 지정 - 서비스에서 처리
		mv = bServ.getContents(bnum);
		
		return mv;
	}
	
	@GetMapping("download") //첨부파일 다운로드(스프링으로 처리 안함)
	public void fileDownload(BfileDto bfile,
			HttpServletResponse res) {
		log.info("oriName : " + bfile.getBf_oriname());
		bServ.fileDownload(bfile, res);
	}
	
	@PostMapping(value = "replyIns",
			produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map<String, List<ReplyDto>> replyInsert(ReplyDto reply) {
		log.info("replyInsert()");
		
		Map<String, List<ReplyDto>> rmap = bServ.replyInsert(reply);
		
		return rmap;
	}
} //class end








