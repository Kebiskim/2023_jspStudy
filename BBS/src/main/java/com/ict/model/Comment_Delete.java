package com.ict.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ict.db.DAO;

public class Comment_Delete implements Command {
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String c_idx = request.getParameter("c_idx");
//		System.out.println(c_idx);
		String b_idx = request.getParameter("b_idx");
		String cPage = request.getParameter("cPage");
		int result = DAO.getC_delete(c_idx);
		// 포워드는 리퀘스트가 계속 살아서 돌아다니는 것. (리퀘스트값이 살아있는 것)
		return "MyController?cmd=onelist&b_idx="+b_idx+"&cPage="+cPage;
	}
}
