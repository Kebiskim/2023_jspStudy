package com.ict.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ict.model.MyModel06;

// 톰캣이 페이지로 접근하는 주소가, 아래 WebServlet
@WebServlet("/MyController6")
public class MyController6 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	// ★ Controller에서 가지고 와지는지, 여기서 먼저 실행해 보자!!
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/xml; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		MyModel06 model06 = new MyModel06();
		String result = model06.exec(request, response);
		out.print(result);;
	}
}
