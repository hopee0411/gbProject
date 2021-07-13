package com.hm.gongbang.dao;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import com.hm.gongbang.dto.CouponDto;
//import com.hm.gongbang.dto.McDto;
import com.hm.gongbang.dto.MemberDto;
import com.hm.gongbang.dto.Pi_viewDto;
import com.hm.gongbang.dto.QuestionDto;
import com.hm.gongbang.dto.ReceptDto;
import com.hm.gongbang.dto.Saving_PointDto;

@Repository


public interface MyDao {

	MemberDto memberInfo(String m_id);

	ArrayList<ReceptDto> receptList(String m_id);

	Saving_PointDto saving_pointInfo(String pt_id);

	CouponDto couponInfo(String m_id);

	int questionInfo(String m_id);

	ArrayList<Pi_viewDto> Pi_viewInfo(String m_id);
	
	//회원 개인정보 수정하기
	public void m_InfoFix(MemberDto member);

	ArrayList<ReceptDto> receptCList(String m_id);

}
