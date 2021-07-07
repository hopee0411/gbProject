package com.hm.gongbang;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.java.Log;

@Log
@Controller
public class MoveController {

	private ModelAndView mv;

	
	@GetMapping("loginFrm")
	public ModelAndView loginFrm() {
		log.info("loginFrm()");
		mv = new ModelAndView();

		mv.setViewName("login");
		return mv;
	}

	
	@GetMapping("m_joinMemberFrm")
	public ModelAndView m_joinMemberFrm() {
		log.info("m_joinMemberFrm()");
		mv = new ModelAndView();

		mv.setViewName("m_joinMember");
		return mv;
	}

	@GetMapping("myPageFrm")
	public String myPage() {

		return "myPage";
	}

	@GetMapping("m_productDelivery")
	public String m_productDelivery() {

		return "m_productDelivery";
	}

	@GetMapping("m_productCancle")
	public String m_productCancle() {

		return "m_productCancle";
	}

	@GetMapping("m_memberManager")
	public String m_memberManager() {

		return "m_memberManager";
	}

	@GetMapping("w_writerQuestionFrm")
	public String w_writerQuestionFrm() {

		return "w_writerQuestion";

	}

	@GetMapping("w_writerManageFrm")
	public String w_writerManageFrm() {

		return "w_writerManage";
	}

	@GetMapping("w_writerHomeFrm")
	public String w_writerHomeFrm() {

		return "w_writerHome";
	}

}// class end
