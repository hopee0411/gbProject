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

	@Autowired
	private HttpSession session;

	private ModelAndView mv;

	@Autowired
	private W_InfoDao wDao;

	public String w_AtPrivateInfo(HttpSession session, String W_ID) {
		
		return null;
	}

	
	
	/*public ModelAndView w_AtPrivateInfoFix(HttpSession session, String userId) {
		
		mv = new ModelAndView();
		
		WriterDto wInfo = wDao.w_AtPrivateInfoFix(userId);
		
		
		mv.addObject("wInfo", wInfo);
		
		return mv;*/
	}
