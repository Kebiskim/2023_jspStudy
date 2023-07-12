package com.ict.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ict.db.BVO;
import com.ict.db.DAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class WriteOkCommand implements Command {
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 파일 업로드를 포함할 수도 있음
		try {
			String path = request.getServletContext().getRealPath("upload");
			MultipartRequest mr = 
					// 용량 부분은 원래는 작성자가 알아서 하면 됨.
					new MultipartRequest(request, path, 100*1024*1024, "utf-8", new DefaultFileRenamePolicy());
			BVO bvo = new BVO();
			bvo.setSubject(mr.getParameter("subject"));
			bvo.setWriter(mr.getParameter("writer"));
			bvo.setContent(mr.getParameter("content"));
			bvo.setPwd(mr.getParameter("pwd"));
			
			// 첨부파일 처리
			if(mr.getFile("f_name") != null) {
				bvo.setF_name(mr.getFilesystemName("f_name"));
			}else {
				bvo.setF_name("");
			}
			
			int result = DAO.getInsert(bvo);
			if(result > 0) {
				// 삽입 성공하면 list로 간다
				return "/MyController?cmd=list";
			}else {
				// 삽입이 안되면 write로 다시 돌아간다
				return "/MyController?cmd=write";
			}
			
		} catch (Exception e) {

		}
		return null;
	}
}
