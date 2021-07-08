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
	
	//�α��� id/pwd Ȯ�� �� ����/���� ó��
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

}//class end
