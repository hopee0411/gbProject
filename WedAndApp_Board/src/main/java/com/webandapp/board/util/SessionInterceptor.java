package com.webandapp.board.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import lombok.extern.java.Log;

@Log
public class SessionInterceptor extends HandlerInterceptorAdapter {
	@Autowired
	HttpSession session;
	
	//컨트롤러로 요청이 전달되기 전에 처리하는 메소드
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		log.info("preHandle() - 인터셉트");
		
		//세션에 로그인 정보(mb)가 없으면 첫페이지로 강제 이동
		if(session.getAttribute("mb") == null) {
			//첫페이지로 이동
			response.sendRedirect("./");
			
			return false;
		}
		return true;
	}
	
	//고칠일이 별로 없어서 그대로 사용하기 - 로그인 > 로그아웃 > 뒤로가기버튼 클릭 > 돌아가지 않음
	//로그아웃 후 뒤로가기 막는 메소드
	//브라우저에 캐쉬(저장)된 페이지 정보를 제거
	//처리가 된 다음에 조치를 취하는것
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		log.info("postHandle() - 뒤로가기 막기");
		
		//현재 웹에는 http 프로토콜 버전이 1.0과 1.1이 혼용됨.
		if(request.getProtocol().equals("HTTP/1.1")) {
			//Cache를 제어, 명령작성(캐시에 있는거 없애, 저장하지말고, )
			response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		}
		else {
			response.setHeader("Pragma", "no-cache");
		}
		//세션 자체의 기간을 줄임 / 즉시 폐기해라
		response.setDateHeader("Expires", 0);
	}
}





















