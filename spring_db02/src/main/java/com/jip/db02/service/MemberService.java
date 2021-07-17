package com.jip.db02.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jip.db02.dao.MemberDao;
import com.jip.db02.dto.MemberDto;

@Service
public class MemberService {
	@Autowired
	private MemberDao mDao;
	
	@Autowired
	private HttpSession session;
	
	private ModelAndView mv;
	
	//회원 가입 처리
	public ModelAndView memberInsert(MemberDto member,
			RedirectAttributes rttr) {
		//controller로부터 회원가입데이터(MemberDto)를 받아서
		//Dao를 사용하여 DB에 회원정보를 삽입하고 컨트롤러에 결과를 보고.
		mv = new ModelAndView();
		
		//이동할 jsp 페이지명을 저장하는 변수
		String view = null;
		//메시지 저장 변수
		String msg = null;
		
		try {
			mDao.memberInsert(member);
			
			//결과에 대한 처리를 수행하는 controller의 메소드로 보냄.
			//가입 성공에 따라 로그인(첫페이지)로 이동
			//첫 페이지를 보이게하는 url = '/'
			view = "redirect:/";
			msg = "가입 성공";
		} catch (Exception e) {
			//아이디 중복으로 인한 실패.
			//새로운 아이디로 가입하도록 가입페이지로 이동
			//가입페이지를 보이게 하는 url = 'joinFrm'
			view = "redirect:joinFrm";
			msg = "아이디 중복";
		}
		
		mv.setViewName(view);//이동할 url 저장
		rttr.addFlashAttribute("msg", msg);//전달할 메시지 저장
		
		return mv;
	} //memberInsert

	//로그인 처리
	public ModelAndView loginProc(MemberDto member, RedirectAttributes rttr) {
		//기존에 있던 인스턴스 없애고 새로 만듦
		//Service 클래스의 메소드의 첫줄에서는 대체적으로 
		//새로운 ModelAndView 인스턴스를 생성한다.
		mv = new ModelAndView();
		
		//이동할 url 저장 변수
		String view = null;
		//메시지 저장 변수
		String msg = null;
		
		//DB에서 해1당 id에 대한 password를 구함.
		String get_pw = mDao.selectPass(member.getM_id());
		
		//1. 정상적 처리되서 메인페이지 이동
		//입력한 id가 db에 존재하면 해당 password를 구할 수 있으며,
		//존재하지 않으면 get_pw는 null이 된다.
		if(get_pw != null) {
			//아이디 있음(가입한 회원)
			if(get_pw.equals(member.getM_pass())) {
				//DB에서 가져온 데이터와 사용자가 입력한 데이터가 같으면 실행
				//로그인 성공 -> main.jsp
				//HomeController로 감
				view = "redirect:main";
				
				//세션에 로그인 성공과 관련된 정보를 저장.
				session.setAttribute("id", member.getM_id());
				
			}
			else {
				//비밀번호 틀림
				view = "redirect:loginFrm";
				msg = "비밀번호가 맞지 않습니다.";
			}
		}
		//2. 로그인 실패 시 다른 페이지로 다시 이동.
		else {
			//아이디 없음
			view = "redirect:loginFrm";
			msg = "아이디를 확인해 주세요.";
		}
		
		mv.setViewName(view);
		//addAttribute로 한 경우 : 주소창에 나타남
		//addFlashAttribute : 1회성으로 나타났다가 사라짐
		rttr.addFlashAttribute("msg", msg);
		
		return mv;
	} //loginProc

	public ModelAndView getMemberInfo(String id) {
		mv = new ModelAndView();
		
		//검색 결과를 저장할 dto 객체 선언
		MemberDto member = null;
		
		if(id != null && !id.equals("")) {
			//dao에서 id로 db를 검색하여 해당 결과를 dto에 저장해줌.
			member = mDao.selectMemberInfo(id);
		}
		
		//db에서 구한 결과 객체(dto)를 model에 추가
		//""안에 : ﻿main.jsp의 ${mem.m_id}의 mem이 인스턴스 이름과 화면에서 꺼낼때의 이름이 같아야함 ﻿﻿
		mv.addObject("mem", member);
		//이 메소드는 정보 출력 및 정보 수정에서 모두 사용하기 위해 
		//아래 문장을 삭제.(페이지 지정은 controller에서...
		//mv.setViewName("main");
		
		return mv;
	} //getMemberInfo

	//수정된 정보와 메시지받음
	public ModelAndView memberUpdate(MemberDto member, RedirectAttributes rttr) {
		
		mv = new ModelAndView();
		
		String view = null;
		String msg = null;
		
		try {
			mDao.memberUpdate(member);
			
			msg = "수정 성공";
		} catch (Exception e) {
			//e.printStackTrace();//<---실행이 안될 경우 이부분의 
            //주석을 해제하고 콘솔창 확인하면 에러부분의 문구가 나옴

			msg = "수정 실패";
		}
		
		view = "redirect:main";
		mv.setViewName(view);
		rttr.addFlashAttribute("msg", msg);
		
		return mv;
	}

	public String memberDelete(String id, RedirectAttributes rttr) {
		String view = null;
		String msg = null;
		
		try {
			mDao.memberDelete(id);
			//로그아웃 처리(삭제 성공시에만!)
			session.invalidate();
			view = "redirect:/";
			msg = "탈퇴 성공";
		} catch (Exception e) {
			e.printStackTrace(); 
			view = "redirect:main";
			msg = "탈퇴 실패. 관리자에게 문의하세요.";
		}
		
		
		rttr.addFlashAttribute("msg", msg);
		
		return view;
	}
} //class end























