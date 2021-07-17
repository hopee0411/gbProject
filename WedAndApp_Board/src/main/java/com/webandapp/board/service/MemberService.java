package com.webandapp.board.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.webandapp.board.dao.MemberDao;
import com.webandapp.board.dto.MemberDto;

@Service
public class MemberService {

	//dao 인스턴스 변수 Autowired 할 것!
	@Autowired
	private MemberDao mDao;
	
	//MidelAndView 하나 만들자!
	private ModelAndView mv;
	
	//session을 Autowired 할 것!
	@Autowired
	private HttpSession session;
	
	@Transactional
	public ModelAndView memInsert(MemberDto member, RedirectAttributes rttr) {
		mv = new ModelAndView();
		
		String view = null;
		String msg = null;
		//비밀번호 암호화 처리	
			//Spring security에서 제공하는 암호화 인코더 사용
			BCryptPasswordEncoder pwdEncoder = new BCryptPasswordEncoder();
			String encPwd = pwdEncoder.encode(member.getM_pwd());
			//원래 비밀번호에 암호화된 비밀버호 덮어쓰기
			//원래 있던거 사라지고 이것만 남게됨
			member.setM_pwd(encPwd);
			System.out.println(encPwd);
		try {
			mDao.memInsert(member);
			
			view = "redirect:/";
			msg = "가입 성공";
			
		} catch (Exception e) {
			view = "redirect:joinFrm";
			msg = "가입 실패";
		}
		
		mv.setViewName(view);
		rttr.addFlashAttribute("msg", msg);
		
		return mv;
	}

	public String idCheck(String mid) {
		String res = null;
		
		//입력한 아이디로D DB를 검색해서 결과가 있으면 사용 불가(fail)
		//없으면 사용 가능 메세지(ok)를 전송
		int cnt = mDao.idCheck(mid);
		//해당 아이디가 있으면 cnt = 1, 없음 cno = 0
		if(cnt == 0) {
			res = "ok";
		}
		else {
			res = "fail";
		}
		return res;
	}

	public String loginProc(MemberDto member, RedirectAttributes rttr) {
		String view = null;
		String msg = null;
		
		//로그인한 아이디가 회원 아이디인지와 패스워드를 가져오는 작업을
		//같이 한다. -> 아이디로 패스워드 검색.
		//DB에서 암호화된 비밀번호를 구함.
		String encPwd = mDao.selectPwd(member.getM_id());
		
		//스프링 암호화 인코더 생성
		BCryptPasswordEncoder pwdEncoder = new BCryptPasswordEncoder();
		
		//로그인 처리
		//해당 아이디 없으면 encPwd가 null
		if(encPwd != null) {
			//아이디 있음.
			//매치 순서 : (사용자 입력 비번, DB 검색 비번)
			if(pwdEncoder.matches(member.getM_pwd(), encPwd)) {
				
				//로그인 성공 -> 세션에 로그인 회원 정보를 저장
				//회원 정보 가져오기(member를 재활용)
				member = mDao.memberSelect(member.getM_id());
				
				//세션에 회원정보 저장
				session.setAttribute("mb", member);
				
				// -> 게시판의 게시글 목록 페이지(메인 페이지)로 이동
				//게시판용 컨트롤러로 이동.(url : list)
				view = "redirect:list";				
			}
			else {
				//비밀번호 틀림.
				view = "redirect:loginFrm";
				msg = "비밀번호 오류";
			}
		}
		else {
			//아이디 없음.
			view = "redirect:loginFrm";
			msg = "아이디 없음";
		}
		
		rttr.addFlashAttribute("msg", msg);
		
		return view;
	}

	//로그아웃
	public String logout() {
		//세션 삭제(인당 1개씩 만들어짐 / 아파치 서버가 세션을 만들어준것을 사용 / 접속한 사람의 정보만 저장)
		session.invalidate(); 
		
		return "home";
	}
}













