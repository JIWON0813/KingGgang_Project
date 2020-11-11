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
	public MemberDTO getMemberBirth(String id) {
		return sqlSession.selectOne("getMemberBirth",id);
	}
	public int loginOk(String id,String passwd){
		String dbPass = sqlSession.selectOne("loginOk", id);
		if (dbPass != null) { 
			if (dbPass.trim().equals(passwd)) {
				return MemberDTO.OK;
			} else {
				return MemberDTO.NOT_PW;
			}
		} else {
			return MemberDTO.NOT_ID;
		}
	}
	public MemberDTO getMemberid(String id){
		return sqlSession.selectOne("getMemberid",id);
	}
	
	public String getMemberProfile(String id){
		return sqlSession.selectOne("getMemberProfile",id);
	}
	public void logout(HttpSession session){
		session.invalidate();
	}
	
	public String searchMember_id(String name, String email){
		java.util.Map<String, String> map = new java.util.Hashtable<String, String>();
		if (name == null || email == null) {
			name = "";
			email = "";
		}
		
		map.put("name", name);
		map.put("email",email);
		
		String id = sqlSession.selectOne("searchMember_id", map);
		if(id==null)
			return null;
		return id;
	}
	
	public String searchMember_pw(String name, String email, String id){
		java.util.Map<String, String> map = new java.util.Hashtable<String, String>();
		if (name == null || email == null || id == null) {
			name = "";
			email = "";
			id="";
		}
		
		map.put("name", name);
		map.put("email",email);
		map.put("id", id);
		
		String passwd = sqlSession.selectOne("searchMember_pw", map);
		if(passwd==null)
			return null;
		return passwd;
	}
	
}
