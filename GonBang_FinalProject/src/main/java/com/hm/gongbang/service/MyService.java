package com.hm.gongbang.service;



import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hm.gongbang.dao.MyDao;
import com.hm.gongbang.dto.CouponDto;
//	import com.hm.gongbang.dto.McDto;
import com.hm.gongbang.dto.MemberDto;
import com.hm.gongbang.dto.Pi_viewDto;
import com.hm.gongbang.dto.QuestionDto;
import com.hm.gongbang.dto.ReceptDto;
import com.hm.gongbang.dto.Saving_PointDto;

import lombok.extern.java.Log;

@Log
@Service
public class MyService {
	private ModelAndView mv; // 밑에서 변수계속 사용위해 위에 한번에 선언
	
	@Autowired
	private HttpSession session; //세션의 회원 정보를 변경하기 위해 필요.
	
	private MemberDto memberDto;
	private ReceptDto receptDto;
	private Saving_PointDto saving_pointDto;
	private CouponDto couponDto;
	private QuestionDto questionDto;
	private Pi_viewDto pi_viewDto;

	
	@Autowired		
	private MyDao myDao;
	//마이페이지 메인 정보 가져오기
	public ModelAndView MyPageMain() {
		mv = new ModelAndView(); //모델을 새로쓰려고 객체를 만듦.
		
		
		// 왼쪽상단 내정보
		memberDto = new MemberDto();
		String m_id = (String)session.getAttribute("id");
		memberDto = myDao.memberInfo(m_id);//myDao로 session에 저장된 id값을 가지고 간다
		session.setAttribute("memberdto", memberDto);
		//mv.addObject("memberdto", memberDto); // 모델에 데이터를 담는다.왜? 다시 리턴시켜서 메인으로 가져가야하니까
		
		
		//적립금
		saving_pointDto = new Saving_PointDto();
		saving_pointDto = myDao.saving_pointInfo(m_id);
		session.setAttribute("saving_pointdto", saving_pointDto);
		
		
		//쿠폰 내역
		couponDto = new CouponDto();
		couponDto = myDao.couponInfo(m_id);
		session.setAttribute("coupondto", couponDto);
		
		//문의 건수
		questionDto = new QuestionDto();
		int qNum = myDao.questionInfo(m_id);
		mv.addObject("qNum", qNum);
		
		
		//최근 주문 내역(영수증)
		receptDto = new ReceptDto();
		ArrayList<ReceptDto> receptList = myDao.receptList(m_id);
		session.setAttribute("receptList", receptList);
		mv.setViewName("myPage");//modelAndView에 이동할 페이지를 담는다
		session.setAttribute("rNum", receptList.size());
		
		//관심작품
		pi_viewDto = new Pi_viewDto();
		ArrayList<Pi_viewDto> pi_viewList = myDao.Pi_viewInfo(m_id);
		mv.addObject("pi_viewList", pi_viewList);
		System.out.println(pi_viewList);
		return mv;
	}//MyPageMain() end

	public String m_InfoFix(MemberDto member, RedirectAttributes rttr) {
		
		String view = null;
		System.out.println(member);
		String getId = (String)session.getAttribute("id");
		member.setM_id(getId);
		try {

			myDao.m_InfoFix(member);
			

			view = "redirect:m_memberManagerFrm";
			rttr.addFlashAttribute("msg", "수정 성공");

		} catch (Exception e) {
			e.printStackTrace();
			view = "redirect:m_memberManagerFrm";
			rttr.addFlashAttribute("msg", "수정 실패");

		}
		return view;
	}
	
	public ModelAndView MyOderCancle() {
		// TODO Auto-generated method stub
		log.info("MyOderCancle()");
		String m_id = (String)session.getAttribute("id");
		receptDto = new ReceptDto();
		ArrayList<ReceptDto> receptCList = myDao.receptCList(m_id);		
		session.setAttribute("receptCList", receptCList);
		mv.setViewName("m_productCancle");//modelAndView에 이동할 페이지를 담는다
		session.setAttribute("rCnum", receptCList.size());
		return mv;
	}

}//class end












