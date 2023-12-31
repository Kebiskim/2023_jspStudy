package com.ict.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Ex07
 */
@WebServlet("/Ex07")
public class Ex07 extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 요청에 대한 한글 처리
		request.setCharacterEncoding("utf-8");
		
		// 응답에 대한 한글 처리
		response.setContentType("text/html; charset=utf-8");
		
		// 출력을 위한 부분
		PrintWriter out = response.getWriter();
		
		try {
			// ★ HTML에서의 type이 number라고 Parameter의 type이 int인 것은 아님 (String임!!) 
			String num1 = request.getParameter("num1");
			String num2 = request.getParameter("num2");
			String op = request.getParameter("op");
			
			int k1 = Integer.parseInt(num1);
			int k2 = Integer.parseInt(num2);
			
			int num3 = Integer.parseInt(request.getParameter("num1"));
			int num4 = Integer.parseInt(request.getParameter("num2"));
			
			int result = 0;
			switch (op) {
			case "+": result = k1 + k2; break;
			case "-": result = k1 - k2; break;
			case "*": result = k1 * k2; break;
			case "/": result = k1 / k2; break;
			
			}
			out.print("<h2>계산기 결과값 : " + k1 + op + k2 + " = " + result + "</h2>");
		} catch (Exception e) {
			out.println("<h2> 결과 : 0으로는 나눌 수 없습니다.</h2>");
		}
	}
}
