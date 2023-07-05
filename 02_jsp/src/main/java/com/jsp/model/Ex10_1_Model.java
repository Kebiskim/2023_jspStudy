package com.jsp.model;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Ex10_1_Model implements Command {
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 선택한 과일을 장바구니에 담자
		String fruits = request.getParameter("fruits");
		// 반환형이 HttpSession (메서드에서 가장 중요한 것은 반환형!!)
		// ★ 세션은 브라우저 한개당 하나임 (아까 그 세션이 옴. 세션도 싱글턴)
		HttpSession ss = request.getSession();
		
		// 과일을 담아야 하지만, 크기를 알 수 없다. (컬렉션 (ArrayList 사용))
		ArrayList<String> list = 
				(ArrayList<String>) ss.getAttribute("list");
		// 맨 처음 받아올 때만 null임. 두번째부터는 null이 없음.
		if(list == null) {
			list = new ArrayList<>();
			// 안의 내용을 다 지워도 null은 아님. 싱글턴 패턴 (한번만 만들어지고 그 이후로 안 만들어짐!!)
			// 리스트를 세션에 넣었음.
			// session에 통 하나가 들어가고, 그 안에 배열이 여러개가 있는 것!! (fruits)
			ss.setAttribute("list", list);
		}
		
		// 리스트에 선택된 과일 추가
		list.add(fruits);
		
		// 자기자신으로 다시 돌아가서 => 새로운 항목을 또 추가할 수 있도록 한다.
		return "view/Ex10_Session_Cart.jsp";
	}
}
