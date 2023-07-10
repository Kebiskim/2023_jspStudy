package com.guestbook2.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DownController")
public class DownController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		// download.jsp 내용을 서블릿에 갖다 붙여버린 것!
		String path = request.getParameter("path");
		String f_name = request.getParameter("f_name");
		
		// 실제 위치
		String realPath = getServletContext().getRealPath("/"+path);
		
		// 여기 해줘야 한다!
//		response.reset();
	}
}
