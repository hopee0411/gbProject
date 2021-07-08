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

import com.hm.gongbang.dao.W_InfoDao;
import com.hm.gongbang.dto.WriterDto;
import com.hm.gongbang.service.W_InfoService;

import lombok.extern.java.Log;

@Log
@Controller
public class W_InfoController {

	@Autowired
	private W_InfoService wInfoS;
	private WriterDto wDto;
	private W_InfoDao wDao;
	private Model m;
	private ModelAndView mv;

	// 작가 개인정보 출력
	@GetMapping("info")
	public String w_AtPrivateInfo(HttpSession session, String W_ID) {
		
		
		//mv = wInfoS.w_AtPrivateInfo(session, W_ID);
		
		// 세션 안에 id로 정보 찾아와 저장
		String W_id = (String) session.getAttribute("W_ID");
		log.info("info()");

		
		return null;
		
		// W_InfoDao wDao = wDao.a_AtPrivateInfo (Writer);

		// 개인정보 출력 메소드

	}

	/*
	 * @RequestMapping("writer/view.do") public String writerView(String userId,
	 * Model model) { // 회원 정보를 model에 저장 model.addAttribute("dto",
	 * W_InfoService.w_AtPrivateInfoFix(userId));
	 * 
	 * return "writer/w_writerManageSee"; }
	 */

	// 작가 개인정보 수정하기
	@PostMapping("w_AtPrivateInfoFix")
	public String w_AtPrivateInfoFix() {

		return "w_AtPrivateInfoFix";

	}
}
