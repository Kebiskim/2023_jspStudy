package com.ict.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ict.model.MyModel04;

@WebServlet("/MyController4")
public class MyController4 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 톰캣이 실행되면 /MyController에 있는 정보는
		// 항상 게시되어 있음 (특정한 명령을 수행하지 않아도)
		
		request.setCharacterEncoding("utf-8");
		// 가지고 올 것은 xml => html 부분을 변경해 주자.
		response.setContentType("text/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		MyModel04 model04 = new MyModel04();
		String result = model04.exec(request, response);
		out.print(result);
	}
}
