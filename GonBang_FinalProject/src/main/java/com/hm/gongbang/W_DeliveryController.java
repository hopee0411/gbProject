package com.hm.gongbang;

import javax.mail.Session;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hm.gongbang.dto.ReceptDto;
import com.hm.gongbang.dto.WriterDto;
import com.hm.gongbang.service.W_DeliveryService;

import lombok.extern.java.Log;

@Log
@Controller
public class W_DeliveryController {

	@Autowired
	HttpSession session;

	private ModelAndView mv;

	@Autowired
	private W_DeliveryService wDs;

	// 작가 배송 검색 출력
	@GetMapping("wDSerach")
	public ModelAndView wDSearch() {
		mv = new ModelAndView();
		mv.setViewName("w_productDelivery");
		mv = wDs.wSearch();

		return mv;

	}
	// 작가 배송 검색 옵션

	@GetMapping("wDSearchOption")
	public ModelAndView wDSearchOption(ReceptDto rec) {
		mv = new ModelAndView();
		// w_id = (String) session.getAttribute("id");
		System.out.println(rec + "dddddddddddddddddddd");
		mv.setViewName("w_productDelivery");
		mv = wDs.wDSearchOption(rec);

		return mv;
	}

	// 배송 운송장 번호 입력
	@GetMapping(value="dNumPut",produces = "appication/text; charset=utf-8")
	@ResponseBody
	public String dNumPut(ReceptDto rec) {
		//mv = new ModelAndView();
		//mv.setViewName("w_productDelivery");
		System.out.println(rec.getR_num() + rec.getR_dnum());
		System.out.println(rec + "@@@@@@@@@@@@@컨트롤러");
		
		String a = wDs.dNumPut(rec);;
		return a;
	}

	// 실패

	/*
	 * @GetMapping("wDSearchOption") public ModelAndView wDSearchOption(String w_id,
	 * ReceptDto rec) { mv = new ModelAndView(); w_id = (String)
	 * wDs.wDSearchOption(w_id, rec);
	 * 
	 * return mv; }
	 */
}
