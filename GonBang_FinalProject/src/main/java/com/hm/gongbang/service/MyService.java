package com.hm.gongbang.service;


import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hm.gongbang.dao.MyDao;
import com.hm.gongbang.dto.MemberDto;
import com.hm.gongbang.dto.ReceptDto;
import com.hm.gongbang.dto.Saving_PointDto;

@Service
public class MyService {
	
	private ModelAndView mv; // 밑에서 변수계속 사용위해 위에 한번에 선언
	
	@Autowired
	private HttpSession session; //세션의 회원 정보를 변경하기 위해 필요.
	
	private MemberDto memberDto;
	private ReceptDto receptDto;
	private Saving_PointDto saving_pointDto;
	@Autowired
	private MyDao myDao;
	
	//마이페이지 메인 정보 가져오기
	public ModelAndView MyPageMain() {
		mv = new ModelAndView(); //모델을 새로쓰려고 객체를 만듦.
		
		memberDto = new MemberDto();
		String m_id = (String)session.getAttribute("id");
		memberDto = myDao.memberInfo(m_id);//myDao로 session에 저장된 id값을 가지고 간다
		mv.addObject("memberdto", memberDto); // 모델에 데이터를 담는다.왜? 다시 리턴시켜서 메인으로 가져가야하니까
		
		saving_pointDto = new Saving_PointDto();
		String pt_id = (String)session.getAttribute("id");
		saving_pointDto = myDao.saving_pointInfo(m_id);
		mv.addObject("saving_pointdto", saving_pointDto);
		
		receptDto = new ReceptDto();
		ArrayList<ReceptDto> receptList = myDao.receptList(m_id);		
		mv.addObject("receptList", receptList);
		System.out.println("데이터확인 " + receptList);
		mv.setViewName("myPage");//modelAndView에 이동할 페이지를 담는다
		
		return mv;
	}//MyPageMain() end


}//class end
