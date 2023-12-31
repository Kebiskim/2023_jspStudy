package com.ict.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Command {
	// cmd가 1번일 때 내용, 2번일때 내용 등이 다 다르기 때문에, interface로 만들어서 쓴다. 주소는 String으로 return 예정.
	public String exec(HttpServletRequest request, HttpServletResponse response);
	
	// 파라미터 값은 전부 request에 저장되어 있고, 응답하려면 response가 있어야 한다!
}
