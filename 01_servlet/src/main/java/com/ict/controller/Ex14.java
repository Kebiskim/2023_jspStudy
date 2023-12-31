package com.ict.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ict.model.Command;
import com.ict.model.GetCalcCommand;
import com.ict.model.GetLuckyCommand;
import com.ict.model.GetTodayCommand;

@WebServlet("/Ex14")
public class Ex14 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		// ex14.html에서 cmd=1, 2, 3으로 나누어 서블릿(Ex14)에 전달 => 자바에서 각 cmd에 따라 각각 일처리
		// => 일처리 마무리하고, 다시 서블릿에 뭔가를 넘겨줌 (도착지의 주소를 return, 결과를 return하는 것이 아님 => 결과보는 페이지의 주소)
		// 여기서 도착지는 한개일수도, 여러개일수도 있음. html 혹은 JSP 페이지의 주소가 return된다.
		// 자바에서 일처리한 내용은 request.setAttribute()에 저장한다!!
		// html에서는 그 내용을 가지고 사용할 수 있음!! (단, request.getAttribute가 JSP로 만들어져야만 가져다 쓸 수 있다!!★)
		
		request.setAttri
		
		// 일처리를 구별하기 위해서 cmd 파라미터를 먼저 받자!
		String cmd = request.getParameter("cmd");
		Command comm = null;
		switch (cmd) {
			case "1":
//				GetTodayCommand comm01 = new GetTodayCommand();
//				String path = comm01.exec(request, response);
//				// 페이지 이동 (forwarding)
//				request.getRequestDispatcher(path).forward(request, response);
				
				// 위 코드처럼 안쓰고 줄여서 써보자. (Command interface를 만들어서 가능한 것!)
				comm = new GetTodayCommand();
				
				// ☆ 자바 일을 여기서 안 하기 때문에, 안에 코드 지워버림.
				break;
			case "2": comm = new GetLuckyCommand(); break;
			case "3": comm = new GetCalcCommand();  break;
		}
		// path가 결과를 보여줄 페이지임.
		String path = comm.exec(request, response);
		// path 경로로 페이지 이동 (포워딩)
		request.getRequestDispatcher(path).forward(request, response);
		// request의 생명주기는, 웹에서는 response 하기 전까지는 안 지워진다!! exec 메서드에 들어있는 정보는 response 하기 전까지
		// 웹에서 가지고 있다!!
	}
}