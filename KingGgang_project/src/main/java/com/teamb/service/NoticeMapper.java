package com.teamb.service;

import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamb.model.NoticeDTO;

@Service
public class NoticeMapper 
{
	@Autowired
	private SqlSession sqlSession;

	public List<NoticeDTO> listNotice(int startRow, int endRow) 
	{
		Map<String, Integer> map = new Hashtable<String, Integer>();
		map.put("start" , startRow);
		map.put("end", endRow);
		List<NoticeDTO> list = sqlSession.selectList("listNotice", map);
		
		return list;
	}

	public int getCount() 
	{
		int count = sqlSession.selectOne("noticeCount");
		return count;
	}

	public int insertNotice(NoticeDTO dto) 
	{
		int res = sqlSession.insert("insertNotice", dto);
		return res;
	}

	public int N_plusReadcount(int no) 
	{
		return sqlSession.update("N_plusReadcount", no);
		 
	}

	public NoticeDTO getNotice(int no) 
	{
		NoticeDTO dto = sqlSession.selectOne("getNotice", no);
		return dto;
	}

	public int deleteNotice(int no) 
	{
		int res = sqlSession.delete("deleteNotice", no);
		return res;
	}

	public int updateNotice(NoticeDTO dto) 
	{
		int res = sqlSession.update("updateNotice", dto);
		return res;
	}
}
