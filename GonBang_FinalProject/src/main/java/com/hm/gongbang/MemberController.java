package com.hm.gongbang;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {
	
	private ModelAndView mv;
	
	@PostMapping("loginProc")
	public ModelAndView loginFrm() {
		mv = new ModelAndView();
		
		mv.setViewName("home");
		return mv;
	}
}
