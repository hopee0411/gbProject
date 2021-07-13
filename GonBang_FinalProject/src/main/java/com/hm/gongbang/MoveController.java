package com.hm.gongbang;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hm.gongbang.service.MyService;
import com.hm.gongbang.service.W_InfoService;

import lombok.extern.java.Log;
import oracle.jdbc.proxy.annotation.Post;

@Log
@Controller
public class MoveController {
	@Autowired
	private HttpSession session;

	private ModelAndView mv;

	@Autowired
	private W_InfoService wInfoS;

	@Autowired
	private MyService myServ; // 서비스로 넘어갈 변수 지정

	//로그인 페이지 이동 HY
	@GetMapping("loginFrm")
	public ModelAndView loginFrm() {
		log.info("loginFrm()");
		mv = new ModelAndView();

		mv.setViewName("login");
		return mv;
	}//loginFrm() end

	//일반 회원가입 페이지 이동 HY
	@GetMapping("m_joinMemberFrm")
	public ModelAndView m_joinMemberFrm() {
		log.info("m_joinMemberFrm()");
		mv = new ModelAndView();

		mv.setViewName("m_joinMember");
		return mv;
	}//m_joinMemberFrm() end
	
	//작가 회원가입 페이지 이동
	@GetMapping("w_joinWriterFrm")
	public ModelAndView w_joinWriterFrm() {
		log.info("w_joinWriterFrm()");
		mv = new ModelAndView();
		
		mv.setViewName("w_joinWriter");
		return mv;
	}//w_joinWriterFrm() end
	
	//장바구니 이동
	@GetMapping("m_sBasketFrm")
	public ModelAndView m_sBasketFrm() {
		mv = new ModelAndView();
		
		mv.setViewName("m_sBasket");
		return mv;
	}
	
	@GetMapping("myPageFrm")
	public ModelAndView myPage() {
		log.info("myPage()");
		mv = new ModelAndView();
		String id = (String) session.getAttribute("id");
		if (id != null) {
			mv = myServ.MyPageMain();// 서비스로 넘어가기위한 작업
		} else {
			mv.setViewName("home");

		}
		return mv;
	}

	@GetMapping("m_productDelivery")
	public String m_productDelivery() {
		return "m_productDelivery";
	}

	@GetMapping("m_productCancle")
	public String m_productCancle() {
		return "m_productCancle";
	}

	@GetMapping("m_memberManagerFrm")
	public ModelAndView m_memberManager() {
		log.info("m_memberManager()");
		mv = new ModelAndView();
		String id = (String)session.getAttribute("id");
		if(id != null) {
			mv = myServ.MyPageMain();//서비스로 넘어가기위한 작업
		}
		else {
			mv.setViewName("myPage");	
		}
		return mv;
	}
	
	@GetMapping("w_writerManageSee")
	public ModelAndView w_writerManageSee() {
		log.info("w_writerManageSee()");
		mv = new ModelAndView();
		String id = (String)session.getAttribute("id");
		if(id != null) {
			mv = wInfoS.w_AtPrivateInfo(); // > W_InfoService 이동
		}
		else {
			mv.setViewName("home");
		}
		return mv;
	}

	@GetMapping("w_writerQuestionFrm")
	public String w_writerQuestionFrm() {

		return "w_writerQuestion";

	}

	@GetMapping("w_writerManageFrm")
	public String w_writerManageFrm() {

		return "w_writerManage";
	}

	@GetMapping("w_writerHomeFrm")
	public String w_writerHomeFrm() {

		return "w_writerHome";
	}

	/*--------------------안요한----------------------------*/
	// 카테고리 화면(클릭 시 화면)
	// category();
	@GetMapping("category")
	public String category() {
		log.info("category()");

		return "category";
	} // category ends

	// 작품 상세보기 페이지
	// productContents()
	@GetMapping("productContents")
	public String productContents() {
		log.info("productContents()");

		return "productContents";
	} // productContents end

}// class end
