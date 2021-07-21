package com.hm.gongbang.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.hm.gongbang.dao.CategoryDao;
import com.hm.gongbang.dto.CategoryDto;
import com.hm.gongbang.dto.ProductDto;


// 요한 
@Service
public class CateGroryService {
	
	
	private ModelAndView mv;
	
	@Autowired 
	private CategoryDao cDao;
	
	/*
	 * @Autowired private CategoryDto cDto;
	 */
	// 카데고리
	public ModelAndView categoryinfo(String kate) {
		 mv = new ModelAndView();
		 
			/* cDto = new CategoryDto(); */
		 
		 // 카테 고리 별 데이터 제품 정보 출력
		 ArrayList<CategoryDto> cList = cDao.categoryinfo(kate);
		 mv.addObject("cList", cList);		 
		 System.out.println(cList.get(0));
		 mv.setViewName("category");
		
		 //옵션 선택시 옵션 별 선택
		
		 
		 // 옵션 리스트 데이터
		
		return mv;
	} // 카테고리 끝

	public ModelAndView optionchose(ProductDto pd) {
		mv = new ModelAndView();
		
		int age = pd.getP_age();
		String gender = pd.getP_gender();
				
		
		mv = cDao.optionage(age);
		System.out.println(age);
		
		/* mv = cDao.optioncgender(gender); */
		
		
		
		return mv;
	}


	
} // class end
