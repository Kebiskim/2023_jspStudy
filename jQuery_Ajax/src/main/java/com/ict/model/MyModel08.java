package com.ict.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ict.db.DAO;
import com.ict.db.MVO;

public class MyModel08 implements Command {
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// DB 가서 members 테이블의 전체 정보 가져오기
		List<MVO> list = DAO.membersList();
		// System.out.println(list.get(0).getM_name());
		
		// xml, json, text로 만들어서 controller로 넘어가자!
		StringBuffer sb = new  StringBuffer();
		// 모든 xml 파일은 맨 첫줄에 아래 줄이 나와야 함.
		// ★ xml은 태그로만 이루어진 것, 태그와 속성으로 이루어진 것, 태그 + 속성으로 이루어진 것 세종류가 있음
		sb.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		sb.append("<members>");
		for (MVO k : list) {
			sb.append("<member>");
			// 태그는 db랑 똑같이 안해도 됨 (m_idx 안해도 O)
			// xml의 특징 : 태그를 내가 만든다.
			sb.append("<idx>" + k.getM_idx() + "</idx>");
			sb.append("<id>" + k.getM_id() + "</id>");
			sb.append("<pw>" + k.getM_pw() + "</pw>");
			sb.append("<name>" + k.getM_name() + "</name>");
			sb.append("<age>" + k.getM_age() + "</age>");
			sb.append("<reg>" + k.getM_reg().substring(0,10) + "</reg>");
			sb.append("</member>");
		}
		sb.append("</members>");
		return sb.toString();
	}
}
