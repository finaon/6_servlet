package com.kh.notice.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.notice.model.vo.Notice;

public class NoticeService {
	
	public ArrayList<Notice> selectNoticeList(){
		Connection conn = getConnection();
		
		ArrayList<Notice> list = new NoticeDao().selectNoticeList(conn);
		
		close(conn);
		return list;
	}
	
	public int insertNotice(Notice n) {
		Connection conn = getConnection();
		
	}
	
	

}
