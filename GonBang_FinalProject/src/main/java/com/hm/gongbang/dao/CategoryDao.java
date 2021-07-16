package com.hm.gongbang.dao;

import java.util.ArrayList;

import com.hm.gongbang.dto.CategoryDto;
import com.hm.gongbang.dto.ProductDto;

public interface CategoryDao {
	
	
	ArrayList<CategoryDto> categoryinfo(String kate);

}
