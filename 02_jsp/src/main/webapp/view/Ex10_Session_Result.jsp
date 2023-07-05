<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>장바구니 보기</h2>
	<h3>
		<%
			// 자료형은 항상 왼쪽 기준으로 맞춰야 한다!!
			ArrayList<String> list = 
				(ArrayList<String>) session.getAttribute("list");
		
			// 장바구니가 없거나 or 장바구니 안에 내용이 없는 경우,
			if(list == null || list.size() <= 0){
				out.println("장바구니에 상품이 존재하지 않습니다.");
			}else{
				// list에서 String 자료형의 값 k(들)을 꺼내온다.
				for(String k : list){
					out.println("<li>" + k + "</li>");
				}
			}
		%>
	</h3>
</body>
</html>