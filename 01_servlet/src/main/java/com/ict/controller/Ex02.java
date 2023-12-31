package com.ict.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Ex02
 */
@WebServlet("/ictedu")
public class Ex02 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
//    /**
//     * @see HttpServlet#HttpServlet()
//     */
//    public Ex02() {
//        super();
//        // TODO Auto-generated constructor stub
//    }
//
//	/**
//	 * @see Servlet#init(ServletConfig)
//	 */
//	public void init(ServletConfig config) throws ServletException {
//		// TODO Auto-generated method stub
//	}
//
//	
//	/**
//	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
//	 */
//	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//	}
//
//	/**
//	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
//	 */
//
//	/**
//	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
//	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// get방식이면 아래 줄이 그대로 나옴.
		// 자바에서 웹브라우저에 화면 출력할 때 getWriter 사용. (아래줄은 기본값)
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		// 선생님 방식
		doPost(request, response);
		
		// 이런 식으로 쓸수도 있음. (두번 타이핑 안하기 위해서)
		
		// myService(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// post방식은 여기로 왔다가 다시 get으로 가기 때문에(메서드 호출한 곳으로 돌아감), 이중으로 작업 안해도 됨.
//		doGet(request, response);
		
		// myService(request, response);
		
		// 응답에 대한 한글처리
		// ContentType => 해당 문서 타입 
		response.setContentType("text/html; charset=utf-8");
		
		// 자바에서 웹 문서 만들기
		PrintWriter out = response.getWriter();
		
		// println과 print가 여기서는 의미가 같음 (태그가 중요)
		out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("<meta charset='UTF-8'>");
        out.println("<title>제목 태그 : h1 ~ h6</title>");
        out.println("<</head>");
        out.println("<h0 style='background-color:red;'> 제목 태그h0 </h0>");
        // h0이란 태그가 없기 때문에 줄안바뀌고 일반 글자처럼 써짐
        out.println("<h0>제목 태그 h0 </h0>");
        out.println("<h1 style='background-color:blue;'> 제목 태그h1 </h1>");
		out.println("<h2> 제목 태그 h2 </h2>");
		out.println("<h3> 제목 태그 h3 </h3>");
		out.println("<h4> 제목 태그 h4 </h4>");
		out.println("<h5> 제목 태그 h5 </h5>");
		out.println("<h6> 제목 태그 h6 </h6>");
		out.println("<h7> 제목 태그 h7 </h7>");
		out.println("<hr>");
		out.println("<h1> 제목 태그 h1 </h1>");
		out.println("<h1 style='font-size: 48px'> 제목 태그 h1 </h1>");
		out.println("<hr>");
		out.println("<span style='background-color: yellow;'>HTML & CSS</span>");
		out.println("<span>JavaScript</span>");
		out.println("</body>");
		out.println("</html>");
	}
	
//	protected void myService(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
//		
//	}
//	
//	
//	/**
//	 * @see Servlet#destroy()
//	 */
//	public void destroy() {
//		
//	}


}
