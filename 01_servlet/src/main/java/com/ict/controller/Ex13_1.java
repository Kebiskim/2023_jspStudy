package com.ict.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Ex13_1")
public class Ex13_1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		// 일처리를 구별하기 위해서 cmd 파라미터를 먼저 받자!
		String cmd = request.getParameter("cmd");
		switch (cmd) {
			case "1":
				// 오늘날짜 구하기
				// 뒤에 new 빠져야 함!!
				Calendar now = Calendar.getInstance();
				int year = now.get(Calendar.YEAR);
				int month = now.get(Calendar.MONTH) + 1;
				int day = now.get(Calendar.DATE);
				
				out.println("<h2>Ex13_1 페이지(오늘날짜 구하기)</h2>");
				out.println("<h2>" + year + ". " + month + ". " + day + ". </h2>");
				break;
			case "2":
				// 오늘 운세 구하기
				// Math.random()은 double형임 
				int lucky = (int) (Math.random()*100+1);
				
				out.println("<h2>Ex13_2 페이지</h2>");
				out.println("<h2>오늘의 운세 : " + lucky + "% </h2>");
				break;
			case "3":
				// 계산기
				// 파라미터값이 존재함
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
				out.println("<h2>" + s1 + op + s2 + " = " + result);
				
				// 여기서 바로 실행하면, 에러남 HTTP 상태 500 – 내부 서버 오류
				// java.lang.NumberFormatException: Cannot parse null string
				// 숫자가 들어갈 자리에 숫자가 안 들어가서 나오는 Error!!
				// html에 action이 세가지라서 servlet을 세개 만들었음!!!
				break;
		}
	}

}
