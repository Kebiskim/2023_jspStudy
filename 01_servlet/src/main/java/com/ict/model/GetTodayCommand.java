package com.ict.model;

import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GetTodayCommand implements Command{
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 여기서 일처리 한다! (오늘날짜 구하기)
		// 아래에 갈 곳을 정해 준다(결과를 보여줄 페이지, HTML은 안 되니까 JSP로 지정!!)
		// 뒤에 new 빠져야 함!!
		Calendar now = Calendar.getInstance();
		int year = now.get(Calendar.YEAR);
		int month = now.get(Calendar.MONTH) + 1;
		int day = now.get(Calendar.DATE);
		
		// 화면에 보여줄 내용을 request.setAttribute를 이용해서 저장하자.
		// "year"가 이름, year가 값.
		request.setAttribute("year", year);
		request.setAttribute("month", month);
		request.setAttribute("day", day);

		// 결과를 보여줄 페이지 지정
		return "view/result01.jsp";
	}
}
