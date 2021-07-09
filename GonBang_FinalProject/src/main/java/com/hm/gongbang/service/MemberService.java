package com.hm.gongbang.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hm.gongbang.dao.MemberDao;
import com.hm.gongbang.dto.Mw_viewDto;

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
		String mw_id = mwDto.getId();
		mwDto = mDao.loginProc(mw_id);		
		if(mwDto.getPwd() !=null) {
			if(mwDto.getPwd().equals(mw_pwd)) {				
				view = "redirect:/";
				msg = "로그인 하셨습니다.";
				session.setAttribute("id", mwDto.getId());
				session.setAttribute("code", mwDto.getMw_code());
				
			}
			else {
				view = "redirect:loginFrm";
				msg = "비밀번호를 확인해주세요";
			}
		}//if end
		else {
			view = "redirect:loginFrm";
			msg = "아이디를 확인해주세요";
		}//else end
		
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

}//class end
