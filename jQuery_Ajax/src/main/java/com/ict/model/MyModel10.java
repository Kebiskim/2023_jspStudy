package com.ict.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ict.db.DAO;

public class MyModel10 implements Command {
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		String m_id = request.getParameter("m_id");
		// 내용을 지우고 다시 썼을 때 버튼이 다시 false로 안 바뀜
		int result = 1;
		if(m_id != null && m_id.length() > 0) {
			result = DAO.getIdChk(m_id);			
		}
		return String.valueOf(result);
	}
}