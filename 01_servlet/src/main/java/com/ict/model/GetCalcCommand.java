package com.ict.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GetCalcCommand implements Command {
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 일처리
		double s1 = Double.parseDouble(request.getParameter("s1"));
		double s2 = Double.parseDouble(request.getParameter("s2"));
		String op = request.getParameter("op");
		
		double result = 0;
		switch (op) {
		case "+": result = s1 + s2; 
		break;
		case "-": result = s1 - s2; 
		break;
		case "*": result = s1 * s2; 
		break;	
		case "/": result = (int)((s1 / s2)*1000)/1000.0; 
		break;
		}
		
		// 화면에 보여줄 내용을 request.setAttribute를 이용해서 저장하자.
		request.setAttribute("s1", s1);
		request.setAttribute("s2", s2);
		request.setAttribute("op", op);
		request.setAttribute("result", result);
		
		return "view/result03.jsp";
	}
}
