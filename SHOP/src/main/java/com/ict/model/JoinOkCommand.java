package com.ict.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ict.db.DAO;
import com.ict.db.MemberVO;

public class JoinOkCommand implements Command {
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 회원 가입 완료 시 로그인화면으로 다시 이동
		String idx = request.getParameter("idx");
		String m_id = request.getParameter("m_id");
		String m_pw = request.getParameter("m_pw");
		String m_name = request.getParameter("m_name");
		String m_age = request.getParameter("m_age");
		String m_addr = request.getParameter("m_addr");
		MemberVO mvo = new MemberVO();
		mvo.setIdx(idx);
		mvo.setM_id(m_id);
		mvo.setM_pw(m_pw);
		mvo.setM_name(m_name);
		mvo.setM_age(m_age);
		mvo.setM_addr(m_addr);
//		System.out.println("번호는" + mvo.getIdx());
//		System.out.println("아이디는" + mvo.getM_id());
//		System.out.println("주소는" + mvo.getM_addr());
		int result = DAO.InsertMemberInfo(mvo);
		
		return "view/login.jsp";
	}
}
