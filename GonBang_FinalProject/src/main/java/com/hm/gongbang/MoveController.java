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
		mv = new ModelAndView();
		
		mv.setViewName("login");
		return mv;
	}

	@GetMapping("w_writerQuestionFrm")
	public String w_writerQuestionFrm() {
		log.info("w_writerQuestionFrm()");
		
		return "w_writerQuestion";
	
	}
	
	@GetMapping("w_writerManageFrm")
	public String w_writerManageFrm() {
		log.info("w_writerManageFrm");
		
		return "w_writerManage";
	}
}
	
	
}//class end
