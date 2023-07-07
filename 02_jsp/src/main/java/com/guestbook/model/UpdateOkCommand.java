package com.guestbook.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.guestbook.db.DAO;
import com.guestbook.db.VO;

public class UpdateOkCommand implements Command {
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String idx = request.getParameter("idx");
		VO vo2 = new VO();
		vo2.setIdx(idx);
		vo2.setName(request.getParameter("name"));
		vo2.setSubject(request.getParameter("subject"));
		vo2.setContent(request.getParameter("email"));
		vo2.setEmail(request.getParameter("email"));
		// 패스워드 안하는 이유는 => 패스워드는 수정하는 게 별도로 있음.
		
		// 업데이트
		// command에서는 무조건 dao로 간다!!
		int result = DAO.getUpdate(vo2);
		
		// 업데이트 성공후 다시 onelist로 가기 떄문에 idx로 정보를 다시 가져와야 한다.
		VO vo = DAO.getOneList(idx);
		request.setAttribute("vo", vo);
		return "guestbook/onelist.jsp";
	}
}