package com.hm.gongbang.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hm.gongbang.dto.W_InfoDto;
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
	
	private W_InfoDto w_infoDto;
	
	@Autowired
	private W_InfoDao w_InfoDao;

	@Autowired
	private W_InfoDao wDao;


	// 작가 개인정보 가져오기2
		public ModelAndView w_AtPrivateInfo() {
			log.info("w_AtPrivateInfo()");
			mv = new ModelAndView();

			w_infoDto = new W_InfoDto();
			String w_id = (String) session.getAttribute("id");
			w_infoDto = w_InfoDao.w_AtPrivateInfo(w_id);
			session.setAttribute("w_infodto", w_infoDto);

			mv.setViewName("w_writerManageSee");// 이동할 페이지

			return mv;
		}

	// 작가 개인정보 수정하기
	public String w_AtPrivateInfoFix(W_InfoDto writer, RedirectAttributes rttr) {
		String view = null;
		System.out.println("확인:@@@@@@" + writer);
		
		String wh_gbname = writer.getWh_gbname();
	
		try {
			

			wDao.w_AtPrivateInfoFix(writer);
			System.out.println("확인2@@@@@" + writer);
			wDao.w_AtPrivateInfoFix2(wh_gbname);
			
			

			
			view = "redirect:w_writerManageSeeFrm";
			rttr.addFlashAttribute("msg", "수정 성공");

		} catch (Exception e) {
			e.printStackTrace();
			view = "redirect:w_writerManageSeeFrm";
			rttr.addFlashAttribute("msg", "수정 실패");

		}

		return view;
	}
	

}






