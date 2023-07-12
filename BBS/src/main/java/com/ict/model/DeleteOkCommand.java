package com.ict.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ict.db.DAO;

public class DeleteOkCommand implements Command{
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String b_idx = request.getParameter("b_idx");
		// 로그 찍어서 제대로 돌아가는지 체크!!
		System.out.println("b_idx : " + b_idx);
		// 원글 삭제
		int result = DAO.getDelete(b_idx);
		return "MyController?cmd=list";
	}
}
