package com.teamb.service;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamb.model.MemberDTO;
/*
�씠	   由� : LoginMapper class
媛�  諛�   �옄 : 諛� 以� �뼵
�꽕	   紐� : 濡쒓렇�씤 留ㅽ띁  �겢�옒�뒪  
*/
@Service
public class LoginMapper {

	@Autowired
	private SqlSession sqlSession;
	
	/*public MemberDTO login(MemberDTO dto){
		return sqlSession.selectOne("login",dto);		
	}*/
	
	public int loginOk(MemberDTO dto){
		String dbPass = sqlSession.selectOne("login", dto);
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
	
	public MemberDTO viewMember(MemberDTO dto){
		return sqlSession.selectOne("viewMember",dto);
	}
	
	public void logout(HttpSession session){
		session.invalidate();
	}
}
