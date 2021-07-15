package com.hm.gongbang;

import java.io.Writer;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hm.gongbang.dao.W_InfoDao;
import com.hm.gongbang.dto.MemberDto;
import com.hm.gongbang.dto.W_InfoDto;
import com.hm.gongbang.dto.WriterDto;
import com.hm.gongbang.service.W_InfoService;

import lombok.extern.java.Log;

@Log
@Controller
public class W_InfoController {

	@Autowired
	private W_InfoService wInfoS;

	private ModelAndView mv;
	// 작가 개인정보 수정하기
	@PostMapping("w_AtPrivateInfoFix")
	public String w_AtPrivateInfoFix(W_InfoDto writer, RedirectAttributes rttr) {
		System.out.println("확인~~~~~~~~~~" + writer);
		log.info("w_AtPrivateInfoFix()");

		String view = wInfoS.w_AtPrivateInfoFix(writer, rttr);

		return view;

	}

	//작가 회원 가입
	@PostMapping("writerJoinProc")
	public ModelAndView writerJoinProc(WriterDto writer, RedirectAttributes rttr) {
		log.info("컨트롤러 writerJoinProc()");
		mv = new ModelAndView();
		System.out.println("데이터확인" + writer);
		mv = wInfoS.writerJoinProc(writer, rttr);
		return mv;
	}//memberJoinProc() end

}//class end



/*
 * @GetMapping("info") public String w_AtPrivateInfo(HttpSession session, String
 * W_ID) {
 * 
 * 
 * //mv = wInfoS.w_AtPrivateInfo(session, W_ID);
 * 
 * // 세션 안에 id로 정보 찾아와 저장 String W_id = (String) session.getAttribute("W_ID");
 * log.info("info()");
 * 
 * 
 * return null;
 * 
 * // W_InfoDao wDao = wDao.a_AtPrivateInfo (Writer);
 * 
 * // 개인정보 출력 메소드
 * 
 * }
 */



