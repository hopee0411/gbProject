package com.jip.db02;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jip.db02.service.MemberService;
import com.jip.db02.dto.MemberDto;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private MemberService mServ;
	
	@Autowired
	private HttpSession session;
	
	private ModelAndView mv;
	
	@GetMapping("/")
	public String home() {
		logger.info("home()");
		
		return "home";
	}
	
	@GetMapping("loginFrm")
	public String loginFrm() {
		logger.info("loginFrm()");
		
		return "loginFrm";
	}
	
	@GetMapping("joinFrm")
	public String joinFrm() {
		logger.info("joinFrm()");
		
		return "joinFrm";
	}
	
	@PostMapping("joinProc")
	public ModelAndView joinProc(MemberDto member,
			RedirectAttributes rttr) {
		//입력 정보 전달 확인용 로그 출력
		logger.info("id: " + member.getM_id());
		
		//서비스에게 회원가입정보, rttr을 보내고
		//가입처리 결과를 받는다.
		mv = mServ.memberInsert(member, rttr);
		
		return mv;
	} //method end
	
	//로그인 처리 작성
	@PostMapping("loginProc")
	public ModelAndView loginProc(MemberDto member, RedirectAttributes rttr) {
		logger.info("loginProc()");
		
		//로그인을 실제 처리하는 서비스로 넘어감
		mv = mServ.loginProc(member, rttr);
		
		return mv;
	}
	
	@GetMapping("main")
	public ModelAndView mainPage() {
		logger.info("mainPAge()");
		//main.jsp를 화면에 보여줄 때 로그인한 회원의 정보를 출력
		
		
		//로그인 한 회원의 정보를 DB에서 가져오기 위해 id를 사용
		//로그인 성공 시 id를 세션에 저장했기 때문에, 
		//세션에 id를 읽어와서 Service 클래스의 해당 메소드에 전달
		//객체로 꺼내져서 앞에 데이터 타입을 지정
		String id = (String)session.getAttribute("id");
		
		//session을 자동으로 만들어줌....?
		mv = mServ.getMemberInfo(id);
		//getMEmberInfo는 회원 정보를 model에 담는 역할만 한다.
		mv.setViewName("main");
		
		return mv;
	} //mainPage
	
	@GetMapping("logout")
	public String logout() {
		logger.info("logout()");
		//session에 저장한 id를 제거
		//  특정 항목만 제거
		///ession.removeAttribute("id");
		//  세션 전체 제거
		session.invalidate(); 
		
		return "home";
	} //logout
	
	//수정을 위한 기존 정보 출력
	@GetMapping("updateFrm")
	public ModelAndView updateFrm() {
		logger.info("﻿updateFrm()");
		String id = (String)session.getAttribute("id");
		
		mv = mServ.getMemberInfo(id);
		mv.setViewName("updateFrm");
		
		return mv;
	}
	
	//수정된 정보 받고 메시지 전송
	@PostMapping("updateProc")
	//수정된 부분을 MemberDto로 한번에 받음
	public ModelAndView updateProc(MemberDto member, RedirectAttributes rttr) {
		logger.info("updateProc");
		
		mv = mServ.memberUpdate(member, rttr);
		
		return mv;
	}
	
	//탈퇴
	@GetMapping("resign")
	public String resignProc(RedirectAttributes rttr) {
		logger.info("resignProc()");
		String id = (String)session.getAttribute("id");
		
		String view = mServ.memberDelete(id, rttr);
		
		return view;
	}
} //class




























