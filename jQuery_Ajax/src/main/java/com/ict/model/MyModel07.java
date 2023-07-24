package com.ict.model;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MyModel07 {
	// 실제로는 exec 안의 파라미터는 항상 쓰는 것은 아님 (request는 쓰는데 response는 안쓰는 경우도 있다)
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		StringBuffer sb = new StringBuffer();
		BufferedReader br = null;
		try {
			URL url = new URL("https://raw.githubusercontent.com/paullabkorea/coronaVaccinationStatus/main/data/data.json");
			URLConnection conn = url.openConnection();
			br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
			String msg = "";
			while((msg = br.readLine()) != null) {
				sb.append(msg);
			}
			return sb.toString();
		} catch (Exception e) {
			
		}finally {
			try {
				
			} catch (Exception e2) {

			}
		}
		// catch 걸리면 null로 나가버리기 (오류 없이)
			return null;
	}
}
