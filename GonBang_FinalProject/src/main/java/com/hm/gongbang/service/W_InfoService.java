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

	private WriterDto writerDto;

	@Autowired
	private W_InfoDao w_InfoDao;

	@Autowired
	private HttpSession session;

	private ModelAndView mv;

	@Autowired
	private W_InfoDao wDao;

	// 작가 개인정보 가져오기
	public ModelAndView w_writerManageSee() {
		log.info("w_writerManageSee()");
		mv = new ModelAndView();
		String view = null;

		writerDto = new WriterDto();

		String w_id = (String) session.getAttribute("id");
		writerDto = w_InfoDao.w_writerManageSee(w_id);
		session.setAttribute("writerDto", writerDto);
			
		return mv;
	}
}








