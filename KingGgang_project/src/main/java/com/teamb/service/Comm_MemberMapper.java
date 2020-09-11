package com.teamb.service;

import java.util.Hashtable;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamb.model.Comm_MemberDTO;
import com.teamb.model.MemberDTO;

@Service
public class Comm_MemberMapper {
	
	@Autowired
	private SqlSession sqlSession;
	
	public Comm_MemberDTO comm_loginOk(Comm_MemberDTO dto){
		return sqlSession.selectOne("comm_loginOk", dto);
	}
	
	public boolean comm_checkMember(int memberNum) {
		Comm_MemberDTO dto = sqlSession.selectOne("comm_checkMember", memberNum);
		if (dto == null)
			return false;
		return true;
	}
	
	public int comm_getmemberNum(String comm_nickname){
		int res = sqlSession.selectOne("comm_getmemberNum",comm_nickname);
		return res;
	}
	
	public int comm_insertMember(Comm_MemberDTO dto){
		int res = sqlSession.insert("comm_insertMember",dto);
		return res;
	}
	
	public List<Comm_MemberDTO> comm_memberList(){
		List<Comm_MemberDTO> list = sqlSession.selectList("comm_memberList");
		return list;
	}
	
	public Comm_MemberDTO comm_getMember(int comm_memberNum){
		return sqlSession.selectOne("comm_getMember",comm_memberNum);
	}
	
	
	public int comm_updateMember(Comm_MemberDTO dto) {
		int res = sqlSession.update("comm_updateMember", dto);
		return res;
	}
	
	public int comm_deleteMember(int comm_memberNum) {
		int res = sqlSession.insert("comm_deleteMember",comm_memberNum);
		return res;
	}

	public int admin_comm_deleteMember(String comm_nickname) {
		int res = sqlSession.insert("admin_comm_deleteMember",comm_nickname);
		return res;
	}
	
/*	public int getComm_memberCount() {
		int count = sqlSession.selectOne("getComm_memberCount");
		return count;
	}

	public List<Comm_MemberDTO> comm_memberList(int startRow, int endRow) {
		java.util.Map<String,Integer> map = new Hashtable<String, Integer>();
		map.put("startRow",startRow);
		map.put("endRow",endRow);
	   return sqlSession.selectList("c_comm_memberList",map);
	}*/
	
	
}
