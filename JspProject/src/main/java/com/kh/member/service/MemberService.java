package com.kh.member.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;

import com.kh.member.model.dao.MemberDao;
import com.kh.member.model.vo.Member;

public class MemberService {
	public Member loginMember(String userId, String userPwd) {
		
		Connection conn = getConnection();
		Member m = new MemberDao().loginMember(conn, userId, userPwd);
		
		close(conn);
		return m;
	}
	
	public int insertMember(Member m) {
		Connection conn = getConnection();
		int result = new MemberDao().insertMember(conn, m);
		
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public Member updateMember(Member m) {
		Connection conn = getConnection();
		int result = new MemberDao().updateMember(conn, m,getUserId());
		
		Member updateMem = null;
		if (result > 0) {
			commit(conn);
			//갱신된 회원객체 다시 조회해오기
			updateMem = new MemberDao().selectMember(conn, m.getUserId());
		} else {
			rollback(conn);
		}
		
		close(conn);
		return updateMem;
		
	}
	
	public Member updatePwdMember(String userId, String userPwd, String updatePwd) {
		Connection conn = getConnection();
		int result = new MemberDao().updatePwdMember(conn, userId, userPwd, updatePwd);
		
		Member updateMem = null;
		if (result > 0) {
			commit(conn);
		}
	}
	
}
