package com.fileup.model;

import java.io.File;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class UpDownCommand {
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 실제 파일 업로드 부분
		try {
			// 실제 저장 위치 구하기 (c: 어쩌구 경로로 들어가면 안됨)
			String realpath = request.getServletContext().getRealPath("upload");
			
			// 파라미터를 받을 때 request 대신에 사용할 객체 cos에서 지원
			MultipartRequest mr = 
					new MultipartRequest(request, 
							realpath,	    // 저장위치 
							100*1024*1024,  // 업로드 크기 (100MB)
							"utf-8",
							new DefaultFileRenamePolicy() // 스프링에는 없는 부분 => 파일이름이 겹치면 이름 뒤에 숫자 붙인다. (spring에선 덮어씀)
							// 스프링에서는 회원가입 하면 그사람 이름으로 폴더를 하나 만들어버림. 그래서 겹치는 것 방지함!
							); 
			
			// 파라미터 받자
			String name = mr.getParameter("name");
			// 올릴 당시의 이름 (업로드할 때 선택한 파일 이름)
			String f_name = mr.getOriginalFileName("f_name");
			// 서버에 저장할 당시의 이름 (변경된 이름), 이걸 사용하지 위에걸 사용할 일 거의 없음!!
			String f_name2 = mr.getFilesystemName("f_name");
			// 문서타입 얻어내기 => 업로드된 파일이 이미지인지, 영상인지 등 알아내는 데 사용!
			String contentType = mr.getContentType("f_name");
			// 위에 있는 f_name들은 ex01에 첨부파일 옆에 있는 f_name들임. (name)
			
			File file = new File(realpath, f_name2);
			long f_size = file.length(); // 파일의 크기를 byte 단위로 변환, kb의 경우 length 구한 후에 /1024 한 것!
			// 마지막 수정한 날짜
			long f_last = file.lastModified();
			
			SimpleDateFormat day=
					new SimpleDateFormat("yyyy-MM-dd HH:mm:ss E");
			String f_last2 = day.format(f_last);
			
			// request는 파라미터 받을 때는 안 쓴다!! (항상 안쓰는 것은 아님!)
			request.setAttribute("name", name);
			request.setAttribute("f_name", f_name);
			request.setAttribute("f_name2", f_name2);
			request.setAttribute("contentType", contentType);
			request.setAttribute("f_size", f_size);
			request.setAttribute("f_last", f_last);
			request.setAttribute("f_last2", f_last2);
			
		} catch (Exception e) {

		}		
		return "fileUpDown/result.jsp";
	}
}
