package com.hm.gongbang;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hm.gongbang.dto.MemberDto;
import com.hm.gongbang.dto.Mw_viewDto;
import com.hm.gongbang.service.MemberService;

import lombok.extern.java.Log;
@Log
@Controller
public class MemberController {
	
	@Autowired
	private MemberService mServ;
	
	private ModelAndView mv;
	
	@PostMapping("loginProc")
	public ModelAndView loginProc(Mw_viewDto mwDto, RedirectAttributes rttr) {
		log.info("loginProc()");
		System.out.println(mwDto.getId());
		mv = new ModelAndView();
		mv = mServ.loginProc(mwDto, rttr);
		return mv;
	}//loginProc() end
	
}//class end
