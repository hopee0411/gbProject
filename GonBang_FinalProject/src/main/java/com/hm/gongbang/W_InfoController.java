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
import com.hm.gongbang.dto.WriterDto;
import com.hm.gongbang.service.W_InfoService;

import lombok.extern.java.Log;

@Log
@Controller
public class W_InfoController {

	@Autowired
	private W_InfoService wInfoS;

	// 작가 개인정보 수정하기
	@PostMapping("w_AtPrivateInfoFix")
	public String w_AtPrivateInfoFix(WriterDto writer, RedirectAttributes rttr) {
		log.info("w_AtPrivateInfoFix()");

		String view = wInfoS.w_AtPrivateInfoFix(writer, rttr);

		return view;

	}
}



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

