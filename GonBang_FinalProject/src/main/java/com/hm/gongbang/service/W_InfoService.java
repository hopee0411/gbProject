package com.hm.gongbang.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hm.gongbang.dto.WriterDto;
import com.hm.gongbang.dao.W_InfoDao;
import com.hm.gongbang.dto.WriterDto;

@Service
public class W_InfoService {

	
	private WriterDto writerDto;
	
	private W_InfoDao w_InfoDao;
	
	@Autowired
	private HttpSession session;

	private ModelAndView mv;


	@Autowired
	private W_InfoDao wDao;

	//작가 개인정보 가져오기
	public ModelAndView w_AtPrivateInfo() {
		mv = new ModelAndView();
		
		writerDto = new WriterDto();
		String W_ID = (String)session.getAttribute("id");
		writerDto = w_InfoDao.w_AtPrivateInfo(W_ID);
		session.setAttribute("writerDto", writerDto);
		//mv.addObject("writerDto", writerDto);
		
		return mv;
	}
}












