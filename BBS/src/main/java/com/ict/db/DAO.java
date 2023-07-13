package com.ict.db;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
//	// 리스트
//	public static List<BVO> getList(){
//		List<BVO> list = getSession().selectList("bbs.list");
//		return list;
//	}
	
	// 페이징 처리
	// 1. 전체 게시물의 수 구하기
	public static int getCount() {
		int result = getSession().selectOne("bbs.count");
		return result;
	}
	
	// 메시지 /view/index.jsp (행: [19], 열: [2]) "name"과 "value" 속성들을 포함한 "jsp:param" 표준 액션이 요구됩니다.
	// DAO에서 메서드 이름이 중복되는 경우
	// 원글 리스트
	// 위에거 주석처리 안해도 오버로딩으로 인해 오류 안남
	public static List<BVO> getList(int begin, int end){
		// select문에서 파라미터가 두개 이상이면 vo 또는 map을 사용해야 한다.
		// map은 interface라서 생성 못함! Cannot instantiate the type Map<String,Integer> 오류  =>  해시맵 사용하자!
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("begin", begin);
		map.put("end", end);
		List<BVO> list = getSession().selectList("bbs.list", map);
		return list;
	}
	
	// 원글 삽입
	public static int getInsert(BVO bvo) {
		int result = getSession().insert("bbs.insert", bvo);
		ss.commit();
		return result;
	}
	
	// 원글 조회수
	public static int getHit(String b_idx) {
		int result = getSession().update("bbs.hit", b_idx);
		ss.commit();
		return result;
	}
		
	// 원글 상세보기 
	// 매퍼에서 DAO로, DAO에서 커맨드로, 거기서 다시 컨트롤러로.
	public static BVO getOneList(String b_idx) {
		BVO bvo = getSession().selectOne("bbs.onelist", b_idx);
		return bvo;
	}
	
	// 원글 수정하기
	public static int getUpdate(BVO bvo) {
		int result = getSession().update("bbs.update", bvo);
		ss.commit();
		return result;
	}
	
	// 원글 삭제
	public static int getDelete(String b_idx) {
		int result = getSession().delete("bbs.delete", b_idx);
		ss.commit();
		return result;
	}
	
	// 댓글 가져오기
	public static List<CVO> getClist(String b_idx){
		List<CVO> c_list = getSession().selectList("bbs.clist", b_idx);
		return c_list;
	}
	
	// 댓글 삽입
	public static int getC_Insert(CVO cvo) {
		int result = getSession().insert("bbs.cinsert", cvo);
		ss.commit();
		return result;
	}
	
	// 댓글 삭제
	public static int getC_delete(String c_idx) {
		int result = getSession().delete("bbs.cdelete", c_idx);
		ss.commit();
		return result;
	}
	
	// 원글 관련 모든 댓글 삭제
	public static int getCommentDeleteAll(String b_idx) {
		int result = getSession().delete("bbs.c_all_delete", b_idx);
		ss.commit();
		return result;
	}
}