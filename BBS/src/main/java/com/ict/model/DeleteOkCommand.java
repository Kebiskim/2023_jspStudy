package com.ict.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ict.db.DAO;

public class DeleteOkCommand implements Command{
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String b_idx = request.getParameter("b_idx");
		String cPage = request.getParameter("cPage");
		// 방법1. 원글에 속한 댓글 삭제
		// 여기서 오류 나네!
		System.out.println("테스트중");
		System.out.println("deleteokcomm b_idx : " + b_idx);

		int res = DAO.getCommentDeleteAll(b_idx);
		
		// 방법2. error 페이지로 이동 (퀴즈)
		
		
		// 방법3. 삭제된 게시글입니다. 로 변경시키는 것 (컬럼추가)
		
		
		// 로그 찍어서 제대로 돌아가는지 체크!!
		System.out.println("b_idx : " + b_idx);
		// 원글 삭제
		int result = DAO.getDelete(b_idx);
		System.out.println("여긴가");
		System.out.println(cPage);
		return "MyController?cmd=list&cPage="+cPage;
	}
}
