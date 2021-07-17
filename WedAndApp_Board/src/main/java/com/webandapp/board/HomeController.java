package com.webandapp.board;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.webandapp.board.dto.MemberDto;
import com.webandapp.board.service.MemberService;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private MemberService mServ;
	
	ModelAndView mv;
	
	@GetMapping("/")
	public String home() {
		logger.info("home()");
		
		return "home";
	}
	
	//메뉴에서 회원가입 버튼 클릭
	@GetMapping("joinFrm")
	public String joinFrm() {
		logger.info("joinFrm()");
		
		return "joinFrm";
	}
	
	//회원가입 페이지에서 가입 클릭시 옴
	@PostMapping("memInsert")
	public ModelAndView memInsert(MemberDto member, RedirectAttributes rttr) {
		logger.info("memInsert()");
		
		mv = mServ.memInsert(member, rttr);
		
		return mv;
	}
	
	//비동기 ajax 사용
	@GetMapping(value = "idCheck", produces = "application/text; charset-utf-8")
	@ResponseBody
	public String idCheck(String mid) {
		logger.info("id : " + mid);
		
		String res = mServ.idCheck(mid);
		
		return res;
	}
	
	@GetMapping("loginFrm")
	public String loginFrm() {
		logger.info("loginFrm()");
		return "loginFrm";
	}
	
	//동기통신 - 일반 사용
	@PostMapping("loginProc") 
	public String loginProc(MemberDto member, RedirectAttributes rttr) {
		logger.info("loginProc()");
		
		String view = mServ.loginProc(member, rttr);
		
		return view;
	}
	
	//로그아웃
	@GetMapping("logout")
	public String logout() {
		String view = mServ.logout();
		
		return view;
	}
}//class end

























