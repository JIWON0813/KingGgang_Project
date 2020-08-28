package com.teamb.service;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamb.model.MemberDTO;
/*
이	   름 : LoginMapper class
개  발   자 : 박 준 언
설	   명 : 로그인 매퍼  클래스  
*/
@Service
public class LoginMapper {

	@Autowired
	private SqlSession sqlSession;
	
	public MemberDTO login(MemberDTO dto){
		return sqlSession.selectOne("login",dto);		
	}
	
	public MemberDTO viewMember(MemberDTO dto){
		return sqlSession.selectOne("viewMember",dto);
	}
	
	public void logout(HttpSession session){
		session.invalidate();
	}
}
