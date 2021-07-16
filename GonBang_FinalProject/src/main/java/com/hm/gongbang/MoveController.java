package com.hm.gongbang;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hm.gongbang.dto.OpptionDto;
import com.hm.gongbang.dto.ProductDto;
import com.hm.gongbang.service.CateGroryService;
import com.hm.gongbang.service.MemberService;
import com.hm.gongbang.service.ProductService;

import lombok.extern.java.Log;
import oracle.jdbc.proxy.annotation.Post;

@Log
@Controller
public class MoveController {

	private ModelAndView mv;
	
	// 멤버 서비스랑 연결 작업용(요한)
	private MemberService mServ;

	// �α��� ������ �̵� HY
	@GetMapping("loginFrm")
	public ModelAndView loginFrm() {
		log.info("loginFrm()");
		mv = new ModelAndView();

		mv.setViewName("login");
		return mv;
	}

	// ����ȸ�� ���� ������ �̵� HY
	@GetMapping("m_joinMemberFrm")
	public ModelAndView m_joinMemberFrm() {
		log.info("m_joinMemberFrm()");
		mv = new ModelAndView();

		mv.setViewName("m_joinMember");
		return mv;
	}

	@GetMapping("myPageFrm")
	public String myPage() {

		return "myPage";
	}

	@GetMapping("m_productDelivery")
	public String m_productDelivery() {

		return "m_productDelivery";
	}

	@GetMapping("m_productCancle")
	public String m_productCancle() {

		return "m_productCancle";
	}

	@GetMapping("m_memberManager")
	public String m_memberManager() {

		return "m_memberManager";
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
	
	
	@Autowired 
	private CateGroryService cServ;
	
	@Autowired
	private ProductService pServ;
	
	// 카테고리 화면(클릭 시 화면)
	// category();
	@GetMapping("category")
	public ModelAndView category(String kate){
		mv = new ModelAndView();
		log.info("category()");
		mv = cServ.categoryinfo(kate);
		
		
		return mv;
	} // category ends
	
	// 작품 상세보기 페이지
	// productContents()
	@GetMapping("productContents")
	public ModelAndView productContents(String cate) {
		log.info("productContents()");
		System.out.println(cate);
		
		mv = pServ.productinfo(cate);
		
		return mv;	
	} // productContents end
	
	// 상품 검색 버튼 클릭시 처리
	// seachFrm()
	@GetMapping("seachFrm")
	public ModelAndView seachFrm() {
		
		
		return mv;
	} // seachFrm end
	
	
	
}//class end
