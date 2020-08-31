// 삭제 예정

package com.teamb.service;

/*import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamb.model.B4_memberDTO;

@Service
public class B4_memberMapper {

	@Autowired
	private SqlSession sqlSession;
	
	
	public int getMemberNum(String id){
		return sqlSession.selectOne("getMemberNum",id);
	}
	

	public List<B4_memberDTO> listMember() {
		return sqlSession.selectList("listMember");
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
	
	public int insertMember(B4_memberDTO dto) {
		int res = sqlSession.insert("insertMember", dto);
		
		return res;
	}
	
	public int loginOk(B4_memberDTO dto){
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
	
	public B4_memberDTO getMember(int memberNum) {
		B4_memberDTO dto = sqlSession.selectOne("getMember", memberNum);
		return dto;
	}
	
	public int updateMember(B4_memberDTO dto) {
		int res = sqlSession.update("updateMember", dto);
		return res;
	}
	
	public int deleteMember(int memberNum) {
		int res = sqlSession.insert("deleteMember", memberNum);
		return res;
	}
	

}*/
