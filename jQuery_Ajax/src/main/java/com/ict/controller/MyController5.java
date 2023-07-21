package com.ict.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ict.model.MyModel05;

@WebServlet("/MyController5")
public class MyController5 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 톰캣이 실행되면 /MyController에 있는 정보는
		// 항상 게시되어 있음 (특정한 명령을 수행하지 않아도)
		
		request.setCharacterEncoding("utf-8");
		// 가지고 올 것은 xml => html 부분을 변경해 주자.
		// text라고도 하는데, plain이라고 함
		response.setContentType("text/plain; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		MyModel05 model05 = new MyModel05();
		String result = model05.exec(request, response);
		out.print(result);
	}
}