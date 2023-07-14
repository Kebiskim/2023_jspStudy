package com.ict.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ict.db.CVO;
import com.ict.db.DAO;

public class Comment_Write implements Command {
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		// request로 받아서
		String b_idx = request.getParameter("b_idx");
		String writer = request.getParameter("writer");
		String content = request.getParameter("content");
		String cPage = request.getParameter("cPage");
		
		// VO 생성해서 거기다 담는다.
		CVO cvo = new CVO();
		cvo.setB_idx(b_idx);
		cvo.setWriter(writer);
		cvo.setContent(content);
	
		int result = DAO.getC_Insert(cvo);
		// 코멘트 달고 다시 onelist로 넘아가자. 그떄 b_idx 넘겨주자!
		return "MyController?cmd=onelist&b_idx="+b_idx+"&cPage="+cPage;
	}
}
