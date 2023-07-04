<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%--
	  스크립트요소 : HTML안에서 실제 자바 코드를 사용할 수 있도록 만드는 요소
	     1) 선언부(<%! 내용 %>) 	 : 변수선언이나 메서드 선언할 때 사용
	     2) 스크립트릿(<% 자바코드 %>) : 자바코드를 코딩할 때 사용 
	     3) 표현식(<% %>)			 : 변수값이나 메서드의 결과 등 저장되어 있는 결과값 출력
	     
	       ** out객체 : out.println(변수)
	       ** 현재는 표현식 대신 표현언어(EL과 JSTL)를 사용한다.
	       
	       ** 주의 사항 : 선언부, 스크립트릿, 표현식을 겹쳐서(포함해서) 사용할 수 없다.
	       // for 문 안에 이런 식으로 쓸 수 없다. <%= i %>
	       // 대신 아래처럼 끊어서 쓰면 자동으로 읽어준다! 
--%>
	<h2>0-10까지 자바의 for문을 사용해서 출력하자.</h2>
	<h3>
		<% for(int i=0; i<11; i++){ %>
				<%= i %>
			<% } %>
	</h3>
	<hr>
	<h2>0-10까지 자바의 for문을 사용해서 출력하자.</h2>
	<h3>
		<%
			for(int i=0; i<11; i++){
				// jsp에 화면에 출력하는 내장 객체 : out 있다. (위 코드보다 훨씬 가독성 높음!!)
				out.println(i);
			}
		%>
	</h3>
	<hr>
	
	<h2>0-10까지의 합을 자바의 for문을 사용해서 출력하자.</h2>
	<%
		int sum = 0;
		for(int i=0; i<11; i++){
			sum = sum + i;
		}
		out.println(sum);
	%>
	
	<h2>0-10까지의 합을 자바의 for문을 사용해서 출력하자.</h2>
	<%
		// 스크립트에서 변수 선언이 가능하다.
		int sum2 = 0;
		for(int i=0; i<11; i++){
			sum2 = sum2 + i;
		}
		out.println("<h3>첫번째 방법 : " + sum2 + "</h3>");
	%>
	
	<h3>두번째 방법 : <%= sum2%></h3>
	<!-- 세번째 방법은 나중에 쓸 수 있음!! (지금은 안된다) -->
	<h3>세번째 방법 : ${sum2}</h3>
	<hr>
	
	<h2>0-10까지 합을 자바의 for문을 사용해서 출력하자</h2>
	<%-- 선언부에서는 변수선언과 메서드 선언을 할 수 있다. (걍 위에처럼 스크립트에서 선언하는 게 편해서 그렇게 씀 --%>
	<%! int sum3 = 0; %>
	<%
		for(int i=0; i<11; i++){
			sum3 = sum3 + i;
		}
		out.println("<h3>네번째 방법 : " + sum3 + "</h3>");
	%>
	<h3>다섯번째 방법 : <%= sum3%></h3>
	<%-- 나중에는 사용할 수 있다. --%>
	<h3>여섯번째 방법 : ${sum3}</h3>
	<hr>
	<h2>변수와 메서드를 만들어서 사용하기(선언부 사용하기)</h2>
	<%!
		public int add(int s1, int s2){
			return s1 + s2;
		}
	
		int result = 0;
		public void sub(int s1, int s2){
			result = s1 - s2;
		}
	%>
	<h3>7 + 5 = <%= add(7,5) %></h3>
	<% sub(7,5); %>
	<h3>7 - 5 = <%= result %></h3>
	<%-- 나중에 사용할 수 있다. --%>
	<h3>7 - 5 = ${result}</h3>
	
	<h2>오늘 날짜와 운수 출력하기</h2>
	<%
		int todays_luck = 0;
		todays_luck = (int)((Math.random() * 100) + 1);
		out.println("오늘의 운수는 " + todays_luck + "<br>");
		
		// JSP는 ctrl + shift + o로 자동 import가 안 된다!!
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH) + 1;
		int date = cal.get(Calendar.DATE);
		int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);

		int hour = cal.get(Calendar.HOUR);
		int minute = cal.get(Calendar.MINUTE);
		int second = cal.get(Calendar.SECOND);
		
		String korDayOfWeek = "";
		switch (dayOfWeek) {
		    case 1:
		        korDayOfWeek = "일";
		        break;
		    case 2:
		        korDayOfWeek = "월";
		        break;
		    case 3:
		        korDayOfWeek = "화";
		        break;
		    case 4:
		        korDayOfWeek = "수";
		        break;
		    case 5:
		        korDayOfWeek = "목";
		        break;
		    case 6:
		        korDayOfWeek = "금";
		        break;
		    case 7:
		        korDayOfWeek = "토";
		        break;
		}
		
		out.println(year+"."+month+"."+date+"("+korDayOfWeek+") "+hour+":"+minute+":"+second);
	%>

	<h2>구구단 5단 출력하기</h2>
	<%
		int level = 5;
		for(int i = 1; i<10; i++){
			out.println("5 * " + i + " = " + level * i + "<br>");
		}
		
	%>
</body>
</html>