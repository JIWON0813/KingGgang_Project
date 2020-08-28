package com.teamb.service;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamb.model.Admin2DTO;


@Service
public class AdminMapper2 
{
	@Autowired
	private SqlSession sqlSession;

	public int InsertAdmin(Admin2DTO dto) 
	{
		int res = sqlSession.insert("InsertAdmin", dto);
		return res;
	}


	public boolean IDcheck(String a_id, String a_passwd)
	{
		System.out.print("id = " + a_id);
		System.out.println(", passwd = " + a_passwd);
		
		String dbPass = sqlSession.selectOne("A_IDcheck", a_id);
		
		if (dbPass.equals(a_passwd))
		{
			return true;
		}
		else
		{
			return false;
		}
	}
}