package com.hm.gongbang.service;


import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hm.gongbang.dao.MemberDao;
import com.hm.gongbang.dto.MemberDto;
import com.hm.gongbang.dto.Mw_viewDto;
import com.hm.gongbang.dto.Shopping_BasketDto;

import lombok.extern.java.Log;

@Log
@Service
public class MemberService {
	
	@Autowired
	private MemberDao mDao;
	
	@Autowired 
	private HttpSession session;
	
	private ModelAndView mv;
	
	//로그인 HY
	public ModelAndView loginProc(Mw_viewDto mwDto, RedirectAttributes rttr) {
		mv = new ModelAndView();		
		String view = null;
		String msg = null;
		String mw_pwd = mwDto.getPwd();
		System.out.println(mw_pwd);
		String mw_id = mwDto.getId();
		BCryptPasswordEncoder pwdEncoder = new BCryptPasswordEncoder();
		try {
			mwDto = mDao.loginProc(mw_id);

			//if(pwdEncoder.matches(mw_pwd,mwDto.getPwd())) {	
			if(mwDto.getPwd() !=null) {

				view = "redirect:/";
				msg = "로그인 하셨습니다.";
				session.setAttribute("id", mwDto.getId());
				session.setAttribute("code", mwDto.getMw_code());				
			}
			else {
				view = "redirect:loginFrm";
				msg = "비밀번호를 확해주세요";
			}
		
		} catch (Exception e) {// TODO: handle exception
			view = "redirect:loginFrm";
			msg = "아이디를 확인해주세요";
		}
		mv.setViewName(view);
		rttr.addFlashAttribute("msg", msg);
		
		return mv;
	}//loginProc() end
	
	//로그아웃 HY
	public ModelAndView logoutProc(RedirectAttributes rttr) {
		session.invalidate();//세션 삭제
		mv = new ModelAndView();
		mv.setViewName("redirect:/");
		rttr.addFlashAttribute("msg", "로그아웃 하셨습니다.");
		return mv;
	}
	
	//아이디 중복체크
	public String idCheck(String id) {
		String res = null;		
		// 입력한 아이디로 DB를 검색해서 결과가 있으면 사용불가(fail)
		// 없으면 사용가능(ok) 메시지를 전송.
		int cnt = mDao.idCheck(id);
		//해당 아이디가 있으면 cnt = 1, 없으면 cnt = 0.
		if(cnt == 0) {
			res = "ok";
		}
		else {
			res = "fail";
		}
		return res;
	}//idCheck() end
	
	//일반 회원 가입(암호화)
	@Transactional
	public ModelAndView memberJoinProc(MemberDto member, RedirectAttributes rttr) {
		// TODO Auto-generated method stub
		log.info("MemberService, memberJoinProc");
		mv = new ModelAndView();
		String view = null;
		String msg = null;
		BCryptPasswordEncoder pwdEncoder = new BCryptPasswordEncoder();
		String encPwd = pwdEncoder.encode(member.getM_pwd());
		member.setM_pwd(encPwd);
		try {
			mDao.memberJoinProc(member);
			mDao.firstCoupon(member.getM_id());
			view = "redirect:loginFrm";
			msg = "회원가입성공";
		} catch (Exception e) {
			//e.printStackTrace();
			view = "redirect:m_joinMemberFrm";
			//msg = "회원가입실패";
		}
		mv.setViewName(view);
		rttr.addFlashAttribute("msg", msg);
		return mv;
	}//memberJoinProc() end
	
	
	//장바구니
	public ModelAndView getBasket() {
		mv = new ModelAndView();
		log.info("MemeberService: getBasket();");
		String m_id = (String)session.getAttribute("id");
		ArrayList<Shopping_BasketDto> basketList = mDao.getBasket(m_id);
		session.setAttribute("basketlist", basketList);
		mv.setViewName("m_sBasket");
		return mv;
	}//getBasket() end


}//class end
