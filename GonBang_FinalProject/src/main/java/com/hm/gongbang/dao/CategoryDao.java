package com.hm.gongbang.dao;

import java.util.ArrayList;

import org.springframework.web.servlet.ModelAndView;

import com.hm.gongbang.dto.CategoryDto;
import com.hm.gongbang.dto.ProductDto;

public interface CategoryDao {
	
	// 카테고리 화면 이동
	ArrayList<CategoryDto> categoryinfo(String kate);

	ModelAndView optionage(int age);

	ModelAndView optioncgender(String gender);
	


}
