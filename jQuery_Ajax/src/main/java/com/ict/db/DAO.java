package com.ict.db;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

//DB 처리하는 메서드들을 가지고 있는 클래스
public class DAO {
	// 실제 사용하는 클래스 : SqlSession
	private static SqlSession ss;
	
	// 싱글턴 패턴 (동기화처리) : 프로그램이 종료될 때까지 한번 만들어진 객체를 재사용한다.
	private synchronized static SqlSession getSession() {
		if(ss == null) {	
			ss = DBService.getFactory().openSession();
		}
		return ss;
	}
	
	public static List<VO> getList(){
		List<VO> list = getSession().selectList("member.list");
		return list;
	}
	
	public static List<MVO> membersList(){
		List<MVO> list = getSession().selectList("members.list");
		return list;
	}
	
	public static int delete(String m_idx) {
		int result = getSession().delete("members.delete", m_idx);
		ss.commit();
		return result;
	}
	
	public static int getIdChk(String m_id) {
		int result = getSession().selectOne("members.idchk", m_id);
		return result;
	}
	
	public static int membersInsert(MVO mvo) {
		int result = getSession().insert("members.insert", mvo);
		ss.commit();
		return result;
	}
}