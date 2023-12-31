package com.ict.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Ex06
 */
@WebServlet("/Ex06")
public class Ex06 extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 요청 시 한글 처리
		request.setCharacterEncoding("utf-8");
		
		// 응답 시 한글 처리
		// text/html 글자 잘 보기!! (아니면 다운로드 오류남!! (파일 이란 형식으로 열림))
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		
		out.print("<h2>여기는 서블릿 Ex06 입니다.</h2>");
		out.print("<h3>");
		out.print("<p>이름 : " + name + "</p>");
		out.print("<p>나이 : " + age + "</p>");
		out.print("</h3>");
	}

}
