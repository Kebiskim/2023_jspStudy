package com.ict.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Ex08
 */
@WebServlet("/Ex08")
public class Ex08_1 extends HttpServlet {
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
			String name = request.getParameter("name");
			int kor = Integer.parseInt(request.getParameter("kor"));
			int eng = Integer.parseInt(request.getParameter("eng"));
			int math = Integer.parseInt(request.getParameter("math"));	
			
			int sum = 0;
			sum = kor + eng + math;
			double avg1 = (((int)(double)sum/3.0)*10)/10.0;  
			
			out.print("<h2>" + name + "학생 성적 계산 결과값 : " + "합계는 " + sum + "이고, 평균은 " + avg1 + "입니다.");
			
		} catch (Exception e) {
			out.print("입력값을 제대로 입력하세요");
		}
	}

}
