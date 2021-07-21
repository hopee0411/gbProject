package com.hm.gongbang.dao;

import java.util.ArrayList;

import com.hm.gongbang.dto.OpptionDto;
import com.hm.gongbang.dto.ProductDto;

public interface ProductDao {
	
	ArrayList<ProductDto> productinfo(String cate);
	
	ArrayList<OpptionDto> opptioninfo(String cate);

	void pview(ProductDto pDto);

}
