package com.ict.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Ex12_3")
public class Ex12_3 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		// 계산기
		// 파라미터값이 존재함
		int s1 = Integer.parseInt(request.getParameter("s1"));
		int s2 = Integer.parseInt(request.getParameter("s2"));
		String op = request.getParameter("op"); 
		
		double result = 0;
		switch (op) {
		case "+": result = s1 + s2; 
		break;
		case "-": result = s1 - s2; 
		break;
		case "*": result = s1 * s2; 
		break;	
		case "/": result = s1 / s2; 
		break;
		}
		out.println("<h2>" + s1 + op + s2 + " = " + result);
		
		// 여기서 바로 실행하면, 에러남 HTTP 상태 500 – 내부 서버 오류
		// java.lang.NumberFormatException: Cannot parse null string
		// 숫자가 들어갈 자리에 숫자가 안 들어가서 나오는 Error!!
		// html에 action이 세가지라서 servlet을 세개 만들었음!!!
	}
}
