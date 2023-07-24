package com.ict.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ict.db.DAO;

public class MyModel09 implements Command {
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// ajax에서 넘어온 파라미터값 확인
		String m_idx = request.getParameter("m_idx");
		System.out.println(m_idx);
		int result = DAO.delete(m_idx);
		return Integer.toString(result);
		// valueof(result) 사용해도 된다.
	}
}