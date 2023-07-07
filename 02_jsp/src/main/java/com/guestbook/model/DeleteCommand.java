package com.guestbook.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.guestbook.db.DAO;
import com.guestbook.db.VO;

public class DeleteCommand implements Command {
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String idx = request.getParameter("idx");
		
		VO vo = DAO.getOneList(idx);
//		request.getAttribute("vo", vo);
		// DB는 자주 가는게 좋을지, 안 가는게 좋은지 => 간단한 건 자주 가는것 상관 X 복잡한 건 덜 가는 것이 좋음.
		// (특히나, 파라미터값을 넘길때는 해킹당할 수 있음)
		return "guestbook/delete.jsp";
	}
}