package com.hm.gongbang.dao;

import com.hm.gongbang.dto.Mw_viewDto;

public interface MemberDao {
	//�Ϲ�, �۰� �α��� ó��
	public Mw_viewDto loginProc(String mw_id);

	public int idCheck(String m_id);


}//class end
