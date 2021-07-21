package com.hm.gongbang;


import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hm.gongbang.service.MemberService;
import com.hm.gongbang.service.MyService;
import com.hm.gongbang.service.W_DeliveryService;
import com.hm.gongbang.service.W_InfoService;
import com.hm.gongbang.service.W_HomeService;

import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hm.gongbang.dto.OpptionDto;
import com.hm.gongbang.dto.ProductDto;
import com.hm.gongbang.dto.Shopping_BasketDto;
import com.hm.gongbang.service.CateGroryService;

import com.hm.gongbang.service.ProductService;

import lombok.extern.java.Log;
import oracle.jdbc.proxy.annotation.Post;

@Log
@Controller
public class MoveController {
	@Autowired
	private HttpSession session;

	@Autowired
	private W_HomeService wServ;

	private ModelAndView mv;
	@Autowired
	private W_InfoService wInfoS;

	@Autowired
	private MemberService mServ;

	@Autowired
	private W_DeliveryService wDs;

	@Autowired
	private MyService myServ; // 서비스로 넘어갈 변수 지정

	// 로그인 페이지 이동 HY
	@GetMapping("loginFrm")
	public ModelAndView loginFrm() {
		log.info("loginFrm()");
		mv = new ModelAndView();

		mv.setViewName("login");
		return mv;
	}// loginFrm() end

	// 일반 회원가입 페이지 이동 HY
	@GetMapping("m_joinMemberFrm")
	public ModelAndView m_joinMemberFrm() {
		log.info("m_joinMemberFrm()");
		mv = new ModelAndView();

		mv.setViewName("m_joinMember");
		return mv;
	}// m_joinMemberFrm() end

	// 작가 회원가입 페이지 이동
	@GetMapping("w_joinWriterFrm")
	public ModelAndView w_joinWriterFrm() {
		log.info("w_joinWriterFrm()");
		mv = new ModelAndView();

		mv.setViewName("w_joinWriter");
		return mv;
	}// w_joinWriterFrm() end

	// 장바구니 이동
	@GetMapping("m_sBasketFrm")
	public ModelAndView m_sBasketFrm() {
		log.info("m_sBasketFrm()");
		mv = new ModelAndView();
		mv = mServ.getBasket();
		return mv;
	}
	
	//행 한줄 삭제
	/*
	@RequestMapping("basketRowDelete")
	public String deleteRow(@RequestParam int sb_basketnum) {
		log.info("deleteRow()");
		
		mServ.deleteRow(sb_basketnum);
		String view = "m_sBasket";
		return view;
	}
	*/
	@PostMapping(value="basketRowDelete", produces="application/text; charset=utf-8")
	@ResponseBody
	public int dataRest(int sb_basketnum) throws Exception {
		log.info("dataRest : " + sb_basketnum);
		int delNum = 0;

		delNum = mServ.deleteRow(sb_basketnum);
		return delNum;
	}
	//선택한거 삭제
	@RequestMapping("delSelect")
    @ResponseBody
    public int deleteReport(Map<String,Object> commandMap) throws Exception{
        int result=1;
        try {
            int cnt = Integer.parseInt((String) commandMap.get("CNT"));
            String rprtOdr = (String)commandMap.get("RPRT_ODR");
            String [] strArray = rprtOdr.split(",");
            for(int i=0; i<cnt; i++) {
                int temp = Integer.parseInt((String)strArray[i]);
                commandMap.put("RPRT_ODR", temp);
                mServ.delete("ReportDAO.deleteReport", commandMap);
            }
        } catch (Exception e) {
            log.info(e.getMessage());
            result=0;
        }
        return result;
       }

	

	// 마이페이지 메인
	@GetMapping("myPageFrm")
	public ModelAndView myPage() {
		log.info("myPageFrm()");
		mv = new ModelAndView();
		String id = (String) session.getAttribute("id");
		if (id != null) {
			mv = myServ.MyPageMain();// 서비스로 넘어가기위한 작업
		} else {
			mv.setViewName("home");

		}
		return mv;
	}

	// 주문/배송 내역
	@GetMapping("m_productDeliveryFrm")
	public String m_productDelivery() {
		log.info("m_productDelivery()");
		String view = "m_productDelivery";
		return view;
	}

	// 취소
	@GetMapping("m_productCancle")
	public ModelAndView m_productCancle() {
		mv = myServ.MyOderCancle();
		return mv;
	}

	// 회원탈퇴
	@GetMapping("m_memberResign")
	public String m_memberResign() {
		String view = "m_memberResign";
		return view;
	}

	// 회원등급
	@GetMapping("m_memberShip")
	public String m_memberShip() {
		String view = "m_memberShip";
		return view;
	}

	// 마이페이지 쿠폰
	@GetMapping("m_savingCoupon")
	public String m_savingCoupon() {
		String view = "m_savingCoupon";
		return view;
	}

	// 마이페이지 적립금
	@GetMapping("m_savinfPoint")
	public String m_savinfPoint() {
		String view = "m_savinfPoint";
		return view;
	}

	// 관심작품
	@GetMapping("m_interestList")
	public String m_interestList() {
		String view = "m_interestList";
		return view;
	}

	// 관심작가
	@GetMapping("m_interesListTwo")
	public String m_interesListTwo() {
		String view = "m_interesListTwo";
		return view;
	}

	// 카드 및 환불계좌 관리
	@GetMapping("m_pay")
	public String m_pay() {
		String view = "m_pay";
		return view;
	}

	// 주소, 배송지관리
	@GetMapping("m_orderContents")
	public String m_orderContents() {
		String view = "m_orderContents";
		return view;
	}

	// 문의내역
	@GetMapping("m_memberQuestion")
	public String m_memberQuestion() {
		String view = "m_memberQuestion";
		return view;
	}

	@GetMapping("m_memberManagerFrm")
	public ModelAndView m_memberManager() {
		mv = new ModelAndView();
		mv.setViewName("m_memberManager");

		return mv;
	}

	@GetMapping("w_writerManageSeeFrm")
	public ModelAndView w_writerManageSeeFrm() {
		mv = new ModelAndView();
		mv.setViewName("w_writerManageSee");

		String id = (String) session.getAttribute("id");
		if (id != null) {
			mv = wInfoS.w_AtPrivateInfo();// 서비스로 넘어가기위한 작업
		}
		return mv;
	}

	@GetMapping("w_productCancleFrm")
	public String w_productCancleFrm() {

		return "w_productCancle";

	}

	@GetMapping("w_productDeliveryFrm")
	public ModelAndView w_productDeliveryFrm() {
		mv = new ModelAndView();
		mv.setViewName("w_productDelivery");

		String id = (String) session.getAttribute("id");
		if (id != null) {
			mv = wDs.wSearch();// 서비스로 넘어가기위한 작업
		} else {
			mv.setViewName("login");

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

	@Autowired
	private CateGroryService cServ;

	@Autowired
	private ProductService pServ;

	// 카테고리 화면(클릭 시 화면)
	// category();
	@GetMapping("category")
	public ModelAndView category(String kate) {
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

}// class end
