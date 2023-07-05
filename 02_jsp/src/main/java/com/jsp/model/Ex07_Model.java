package com.jsp.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Ex07_Model implements Command {
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 일처리
		
		// 파라미터 받기
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		// 실제 로그인 DB 정보를 이용 (아직 jsp에서 DB사용하는 것 안 배움)
		// 간단하게 id와 pw가 같으면 로그인 성공 하기로 하자
		if(id.equals(pw)) {
			// 성공 저장
			// 숫자 해도 되고, 문자 "1" 줘도 된다.
			request.setAttribute("logInChk", 1);
		} else {
			// 실패 저장
			request.setAttribute("logInChk", 0);
		}
		
		// 저장
		
		// 결과가 보여질 페이지가 return 값에 들어감.
		// result로 바로 가는게 아니라, MyController01을 거쳐서 가게 됨!!
		return "view/Ex07_Request_Result.jsp";
	}
}
