package com.hm.gongbang.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.hm.gongbang.dao.W_DeliveryDao;
import com.hm.gongbang.dto.ReceptDto;
import com.hm.gongbang.dto.WriterDto;

import lombok.extern.java.Log;

@Log
@Service
public class W_DeliveryService {
	private ModelAndView mv;

	@Autowired
	private HttpSession session;

	private ReceptDto receptDto;

	@Autowired
	private W_DeliveryDao wDDao;

	// 작가 배송 검색 출력
	public ModelAndView wSearch() {
		mv = new ModelAndView();

		String w_id = (String) session.getAttribute("id");

		// 최근 주문 내역(영수증)
		receptDto = new ReceptDto();
		ArrayList<ReceptDto> receptList = wDDao.receptList(w_id);
		session.setAttribute("receptList", receptList);
		mv.setViewName("w_productDelivery");// modelAndView에 이동할 페이지를 담는다
		session.setAttribute("rNum", receptList.size());

		return mv;
	}

	// 작가 배송 검색 옵션

	public ModelAndView wDSearchOption(String w_id, String r_pname) {
		mv = new ModelAndView();
		receptDto = new ReceptDto();

		ArrayList<ReceptDto> receptList = wDDao.receptPName(w_id, r_pname);
		session.setAttribute("receptList", receptList);
		mv.setViewName("w_productDelivery");// modelAndView에 이동할 페이지를 담는다

		return mv;

		/*
		 * public ModelAndView wDSearchOption(String w_id, ReceptDto rec) { mv = new
		 * ModelAndView(); receptDto = new ReceptDto(); String r_pname =
		 * receptDto.getR_pname();
		 * 
		 * ArrayList<ReceptDto> receptList = wDDao.receptPName(w_id, r_pname);
		 * session.setAttribute("receptList", receptList);
		 * 
		 * mv.setViewName("w_productDelivery");// modelAndView에 이동할 페이지를 담는다
		 * 
		 * return mv; }
		 */
	}
}
