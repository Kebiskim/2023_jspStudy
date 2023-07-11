package com.ict.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ict.model.Command;
import com.ict.model.ListCommand;
import com.ict.model.WriteCommand;
import com.ict.model.WriteOkCommand;

@WebServlet("/MyController")
public class MyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String cmd = request.getParameter("cmd");
		Command comm = null;
		if(cmd.equals("list")) {
			comm = new ListCommand();
		}else if(cmd.equals("write")) {
			// 메시지 요청된 리소스 [/BBS/view/org.apache.jasper.runtime.PageContextImpl@13f354b1/MyController]은(는) 가용하지 않습니다.
			// href 변경하기
			comm = new WriteCommand();
		}else if(cmd.equals("write_ok")) {
			comm = new WriteOkCommand();
		}
		String path = comm.exec(request, response);
		request.getRequestDispatcher(path).forward(request, response);
	}
}
