package com.hm.gongbang.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hm.gongbang.dto.WriterDto;

import lombok.extern.java.Log;

import com.hm.gongbang.dao.W_InfoDao;
import com.hm.gongbang.dto.WriterDto;

@Log

@Service
public class W_InfoService {

	private ModelAndView mv;

	@Autowired
	private HttpSession session;

	private WriterDto writerDto;

	@Autowired
	private W_InfoDao w_InfoDao;

	@Autowired
	private W_InfoDao wDao;

	// 작가 개인정보 가져오기
	public ModelAndView w_AtPrivateInfo() {
		log.info("w_AtPrivateInfo()");
		mv = new ModelAndView();

		writerDto = new WriterDto();
		String w_id = (String) session.getAttribute("id");
		writerDto = w_InfoDao.w_AtPrivateInfo(w_id);
		session.setAttribute("writerdto", writerDto);

		mv.setViewName("w_writerManageSee");// 이동할 페이지

		return mv;
	}

	// 작가 개인정보 수정하기
	public String w_AtPrivateInfoFix(WriterDto writer, RedirectAttributes rttr) {
		String view = null;

		// 비밀번호 암호화 처리
		// Spring security에서 제공하는 암호화 인코더 사용
		/*
		 * BCryptPasswordEncoder pwdEncoder = new BCryptPasswordEncoder();
		 * 
		 * String encPwd = pwdEncoder.encode(writer.getW_pwd()); // 원래 비밀번호에 암호화된 비밀번호
		 * 덮어쓰기 writer.setW_pwd(encPwd);
		 */
		try {
			wDao.w_AtPrivateInfoFix(writer);

			view = "redirect:w_writerManageSee";
			rttr.addFlashAttribute("msg", "수정 성공");

		} catch (Exception e) {
			view = "redirect:w_writerManageSee";
			rttr.addFlashAttribute("msg", "수정 실패");

		}

		return view;
	}

}






