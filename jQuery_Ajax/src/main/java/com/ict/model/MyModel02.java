package com.ict.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ict.db.DAO;
import com.ict.db.VO;

public class MyModel02 implements Command {
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 일처리
		List<VO> list = DAO.getList();
		System.out.println("2에서 일처리 완");
		
		StringBuffer sb = new StringBuffer();
		sb.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		sb.append("<members>");
		for (VO k : list) {
			// 반드시 한칸 띄워야 함.
			// ★ <product name="제네시스" count="5"/> 여기서 product 뒤에 한칸 띄우기 때문!!
			sb.append("<member ");
			sb.append(" idx=\"" + k.getIdx() + "\"");
			sb.append(" m_id=\"" + k.getM_id() + "\"");
			sb.append(" m_pw=\"" + k.getM_pw() + "\"");
			sb.append(" m_addr=\"" + k.getM_addr() + "\"");
			// sb.append(" m_reg=\"" + k.getM_reg() + "\"");
			if(k.getM_reg() != null) {
				sb.append(" m_reg=\"" + k.getM_reg().substring(0, 10) + "\"");
			}else {
				sb.append(" m_reg=''");
			}
			sb.append(" />");
		}
		sb.append("</members>");
		
		// MVC에서는 View 경로를 작성하지만
		// ajax는 만들어진 정보를 전달한다.
		return sb.toString();
	}
}
