package com.ict.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ict.db.BVO;
import com.ict.db.DAO;

public class DeleteCommand implements Command {
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String b_idx = request.getParameter("b_idx");
		String cPage = request.getParameter("cPage");
		
		System.out.println("delete com에서 b_idx" + b_idx);
		BVO bvo = DAO.getOneList(b_idx);
		if(bvo != null) {
			request.setAttribute("bvo", bvo);
			request.setAttribute("b_idx", b_idx);
			request.setAttribute("cPage", cPage);
			return "view/delete.jsp";
		}else {
			return "MyController?cmd=onelist&b_idx="+b_idx+"&cPage="+cPage;
		}
	}
}
