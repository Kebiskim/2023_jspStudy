package com.fileup.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fileup.model.UpDownCommand;

@WebServlet("/FileUpController")
public class FileUpController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		String cmd = request.getParameter("cmd");
		// cmd로 가는지 확인해 보자.
		// hidden으로 되어있으면 값이 안 넘어감.
		System.out.println("cmd 값은" + cmd);
		// 값을 넣고싶으면, ex01의 f.action 에 넣어야 함.
		// 넣으면 제대로 fileup이라고 나옴!! post면서 form태그를 썼는데 hidden 못쓰는 경우 (cmd)
		
		UpDownCommand comm = new UpDownCommand();
		String path = comm.exec(request, response);
		request.getRequestDispatcher(path).forward(request, response);
	}
}
