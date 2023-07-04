<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	fieldset{
		width: 300px;
	}
</style>
<!-- 모든 요청은 서블릿으로 가야함 (JSP에서 JSP로 가면 안된다!!) -->
</head>
<body>
	<form action="Ex05_Result.jsp" method="get">
        <fieldset>
            <legend>개인정보입력</legend>
            <p>이름 : <input type="text" name="name" required></p>
            <p>나이 : <input type="number" name="age" required></p>
            <p>성별 : 
                <input type="radio" name="gender" value="남"  required>남성
                <input type="radio" name="gender" value="여" >여성
            </p>
            <p>취미 : 
                 <input type="checkbox" name="hobby" value="운동">운동
                 <input type="checkbox" name="hobby" value="영화">영화
                 <input type="checkbox" name="hobby" value="게임">게임
                 <input type="checkbox" name="hobby" value="독서">독서
            </p>
            <input type="submit" value="회원가입">
        </fieldset>
    </form>
</body>
</html>