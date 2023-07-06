package com.guestbook.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.guestbook.model.Command;
import com.guestbook.model.ListCommand;
import com.guestbook.model.OneListCommand;
import com.guestbook.model.WriteCommand;
import com.guestbook.model.WriteOkCommand;

@WebServlet("/GuestController")
public class GuestController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		// cmd는 여기서 (서블릿에서) 처리를 해줘야 구분을 나중에 할 수 있다.
		String cmd = request.getParameter("cmd");
		
		// command interface를 통해서 번호별로 구분해줬음. 받은 cmd를 command가 구분해서 보내줌.
		Command comm = null;
		if (cmd.equals("list")) {
			comm = new ListCommand();
		}else if(cmd.equals("write")) {
			comm = new WriteCommand();
		}else if(cmd.equals("write_ok")) {
			comm = new WriteOkCommand();
		}else if(cmd.equals("onelist")) {
			comm = new OneListCommand();
		}
		// ListCommand가 자신을 호출한 Controller로 돌아옴
		String path = comm.exec(request, response);
		//"GuestController?cmd=list"
		request.getRequestDispatcher(path).forward(request, response);
	}
}