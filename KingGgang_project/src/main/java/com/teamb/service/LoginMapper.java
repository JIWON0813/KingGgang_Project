package com.teamb.service;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamb.model.MemberDTO;

/*	이	   름 : LoginMapper class
	개  발   자 : 박 준 언, 황 지 은
	설	   명 : 로그인 매퍼  클래스  */

@Service
public class LoginMapper {

	@Autowired
	private SqlSession sqlSession;
	
	public int getMemberNum(String id){
		return sqlSession.selectOne("getMemberNum",id);
	}
	// 지은
	public String getMemberName(String id){
		return sqlSession.selectOne("getMemberName",id);
	}
	
	public int loginOk(MemberDTO dto){
		String dbPass = sqlSession.selectOne("loginOk", dto);
		if (dbPass != null) {
			if (dbPass.trim().equals(dto.getPasswd())) {
				return dto.OK;
			} else {
				return dto.NOT_PW;
			}
		} else {
			return dto.NOT_ID;
		}
	}
	public MemberDTO getMemberid(String id){
		return sqlSession.selectOne("getMemberid",id);
	}
	public void logout(HttpSession session){
		session.invalidate();
	}
}