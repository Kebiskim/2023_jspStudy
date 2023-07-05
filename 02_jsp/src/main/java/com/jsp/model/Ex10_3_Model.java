package com.jsp.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Ex10_3_Model implements Command {
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 장바구니 비우기
		// 세션 구하기
		HttpSession ss = request.getSession();
		
		// 세션 초기화
		ss.invalidate();
		
		ss.removeAttribute("list");
		
		return "view/Ex10_Session_Cart.jsp";
	}

}
