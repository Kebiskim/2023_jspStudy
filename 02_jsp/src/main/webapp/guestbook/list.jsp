<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록</title>
<style type="text/css">
	a{text-decoration: none;}
	table{
		width: 600px;
		/* 테두리 한줄짜리 만드는 것 */
		border-collapse: collapse; 
		text-align: center;
	}
	table, th, td{
		border: 1px solid black; padding: 3px; 
	}
	div{
		text-align: center;
		/* 테이블 가운데정렬 하는법 */
		width: 600px;
		margin: auto;
	}
</style>
</head>
<body>
	<div>
		<h2>방명록 리스트</h2>
		<hr>
		<p>[<a href="/jsp/GuestController?cmd=write">방명록 쓰기</a>]</p>
		<table>
			<thead>
				<tr style="background-color : #99ccff">
					<th>번호</th><th>작성자</th><th>제목</th><th>작성일</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<!-- 받아온 값이 없을 때, 리스트가 비어있으면, 이라는 뜻 -->
					<c:when test="${empty list}">
						<tr><td colspan="4"><h2>원하는 정보가 존재하지 않습니다.</h2></td></tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="k" items="${list}" varStatus="vs">
							<tr>
								<td>${vs.count}</td> 
								<td>${k.name}</td> 
								<td><a href="/jsp/GuestController?cmd=onelist&idx=${k.idx}">${k.subject}</a></td>
								<!-- jsp에서는 무조건 controller로 간다(cmd를 가지고) --> 
								<td>${k.regdate}.substring(0, 10)</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
</body>
</html>