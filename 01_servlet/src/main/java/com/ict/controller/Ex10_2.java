package com.ict.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 복사해도 아래 URL? 부분이 안 바뀐다. 그래서 오류남!! (똑같은 접근주소의 페이지가 2개 있으므로 오류 난다!!)
@WebServlet("/Ex10_2")
public class Ex10_2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		// JSP에 out 내장 객체가 존재하는데, 같은 기능을 한다.
		PrintWriter out = response.getWriter();
		
		// 페이지 이동 (포워딩, 리다이렉트) : 
		// JSP에도 존재하고 사용하는 기능
		// 현재 페이지에서 작업 후 다른 페이지로 이동 (현재페이지가 보이지 않는다)
		// 리다이렉트 : 다른페이지로 이동하면서 기존의 request와 response 정보가 사라진다.
		//			새로운 request와 response가 만들어진다.
		//			즉, 파라미터값들이 최종 페이지에서는 사라진다.
		//			주소창에는 최종 주소가 보인다.
		// 사용법 : response.sendRedirect("이동할 주소");
		//		  이동할 주소가 servlet이면 확장자를 사용하지 않는다.
		//		  이동할 주소가 html이면 확장자를 사용한다.
		// 내가 Ex10_1을 요청했는데, 리다이렉트 해서 Ex10_2가 보이게 된다!
		// 포워딩은 Ex10_1이 알아서 Ex10_2로 넘기는 것 (req와 parameter는 유지된다)
		// 리다이렉트는 다시 넘어왔다가 다시 보냄. 로그인 틀렸을 때는 리다이렉트 (내가 보낸 id, pw가(파라미터가) 필요가 없음)
		// ★ 로그인 되어있는 상태로 다른 페이지로 넘어갈 때, 포워딩을 사용해야 함 (로그인 해있다는 정보를 계속 전달해야 함!)
		// 또 포워딩 하면 파라미터 값은 계속 따라다님.
		
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		
		out.println("<h2> Ex10_1 </h2>");
		out.println("<h3><ul>");
		out.println("<li>이름 : " + name + "</li>");
		out.println("<li>나이 : " + age + "</li>");
		out.println("</ul></h3>");
		
		// 리다이렉트 실행 (다른 페이지로 이동하는 것 => 현재 페이지가 무시되고 안 보임)
	}
}