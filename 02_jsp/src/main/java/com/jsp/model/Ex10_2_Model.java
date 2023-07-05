package com.jsp.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Ex10_2_Model implements Command {
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// jsp는 세션 호출할 수 있음.
		return "view/Ex10_Session_Result.jsp";
	}
}
