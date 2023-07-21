package com.ict.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ict.db.DAO;
import com.ict.db.VO;

public class MyModel04 implements Command {
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 일처리
		List<VO> list = DAO.getList();
		System.out.println("2에서 일처리 완");
		
		// 받은 정보로 json을 만들자.
		StringBuffer sb = new StringBuffer();
		sb.append("[");
		for (VO k : list) {
			sb.append("{");
			sb.append("\"idx\"" + ":" + "\"" + k.getIdx() + "\",");
			sb.append("\"m_id\"" + ":" + "\"" + k.getM_id() + "\",");
			sb.append("\"m_pw\"" + ":" + "\"" + k.getM_pw() + "\",");
			sb.append("\"m_addr\"" + ":" + "\"" + k.getM_addr2() + "\",");
			if(k.getM_reg() != null) {
				sb.append("\"m_reg\"" + ":" + "\"" + k.getM_reg().substring(0, 10) + "\"");				
			}else {
				sb.append("\"m_reg\"" + ":" + "\" - \"");
			}
			sb.append("},");
		}
		
		sb.deleteCharAt(sb.length() - 1);
		sb.append("]");
		// MVC에서는 View 경로를 작성하지만
		// ajax는 만들어진 정보를 전달한다.
		return sb.toString();
	}
}
