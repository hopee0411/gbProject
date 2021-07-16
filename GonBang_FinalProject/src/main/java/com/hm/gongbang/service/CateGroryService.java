package com.hm.gongbang.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.hm.gongbang.dao.CategoryDao;
import com.hm.gongbang.dto.CategoryDto;
import com.hm.gongbang.dto.ProductDto;


// 요한 
@Service
public class CateGroryService {
	
	
	private ModelAndView mv;
	
	@Autowired 
	private CategoryDao cDao;
	
	// 카데고리
	public ModelAndView categoryinfo(String kate) {
		 mv = new ModelAndView();
		 ArrayList<CategoryDto> cList = cDao.categoryinfo(kate);
		 mv.addObject("cList", cList);		 
		 System.out.println(cList.get(0));
		 mv.setViewName("category");
		
		return mv;
	} // 카테고리 끝

	
} // class end
