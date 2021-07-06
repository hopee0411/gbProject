package com.hm.gongbang;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MoveController {
	
	private ModelAndView mv;
	
	@GetMapping("loginFrm")
	public ModelAndView loginFrm() {
		mv = new ModelAndView();
		
		mv.setViewName("login");
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
}//class end
