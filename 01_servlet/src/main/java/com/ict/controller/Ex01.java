package com.ict.controller;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Ex01
 */
// 서블릿 : 자바를 가지고 웹 페이지를 표현
//		  즉, 자바에서 HTML, CSS, JavaScript 등을 표현해서
//		  웹 페이지로 만든다 (main 메서드는 없다.)

// URLMapping : 인터넷에서 해당 페이지 접근 주소 (/프로젝트/urlmapping) 
@WebServlet("/Ex01")
public class Ex01 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Ex01() {
		System.out.println("생성자");
	}
	
	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// 자바에서 init은 보통 초기화 란 뜻임.
		// 멤버필드 초기화
		// init()이 끝나면 자동으로 service()를 호출한다.
		System.out.println("init");
	}


	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// request : 요청정보를 가지고 있음, response = 응답정보를 가지고 있다.
		// 클라이언트가 정보를 요청할 때 요청방식에 따라 알맞는 메서드를 호출하는 역할
		// HttpServletRequest request 여기가 요청! 
		// HttpServletResponse response 여기가 응답!
		// 스윙에서는 소켓이 가지고 있는데, 웹에서는 위에 애들이 가지고 있음.
		// 요청방식 : get방식 (생략가능) : http 패킷의 header에 정보를 담아서 보낸다.
		//							주소창에 해당 정보가 보인다.
		//							속도는 빠르나 적은양을 전달.
		//							정보가 보이기 때문에 보안에 취약
		// 		   post방식		  : http 패킷의 body에 정보를 담아서 보낸다.
		//							주소창에 정보가 보이지 않는다.
		//							속도는 get방식보다 느리나, 많은 양을 전달할 수 있다.
		
		System.out.println("service");
		
		// doGet(), doPost()를 요청방식에 맞게 호출한다.
		if(request.getMethod().equalsIgnoreCase("get")) {
			doGet(request, response);
		} else if(request.getMethod().equalsIgnoreCase("post")) {
			doPost(request, response);
		}
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	// 실제 웹페이지에 보이는 부분을 처리하는 것은 doGet() 또는 doPost() 이다.
	// doGet() 또는 doPost() 에서 자바코드로 HTML, CSS, JavaScript를 작성하면 
	// 웹 페이지가 client에게 보인다. 
	// get방식이 기본이다! 아무것도 안하면 get방식으로 호출됨.
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost");
	}

	/**
	 * @see Servlet#destroy()
	 */
	// 해당 프로젝트가 톰캣에서 삭제되기 전에 실행되는 메서드
	public void destroy() {
		System.out.println("destroy");
	}
}
