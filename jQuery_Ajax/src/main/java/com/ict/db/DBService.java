package com.ict.db;

import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

// JAR 파일 build path에 넣어버리면 인식 안됨

public class DBService {
	// MyBatis를 사용하기 위해서 SqlSession 클래스가 필요하고
	// SqlSessionFactory 클래스를 가지고 SqlSession클래스를 만든다.
	// ★ DB서비스는 한번 만들어 놓으면 복붙해서 사용하면 됨!!
	private static SqlSessionFactory factory;
	// config.xml 파일 위치
	static String resource = "com/ict/db/config.xml";
	
	// static 초기화
	static {
		try {
			InputStream inputStream = Resources.getResourceAsStream(resource);
			factory = new SqlSessionFactoryBuilder().build(inputStream);
		} catch (Exception e) {
		}
	}
	
	// DAO에서 factory를 호출할 메서드
	public static SqlSessionFactory getFactory() {
		return factory;
	}
}