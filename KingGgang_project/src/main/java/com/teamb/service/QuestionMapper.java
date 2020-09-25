package com.teamb.service;

import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamb.model.MemberDTO;
import com.teamb.model.QuestionDTO;

@Service
public class QuestionMapper 
{
	@Autowired
	private SqlSession sqlSession;

	public int getCount() 
	{
		int count = sqlSession.selectOne("questCount");
		return count;
	}
	
	public int getSCount(String search, String searchString){
		Map<String,String> map = new Hashtable<String,String>();
		map.put("search", search);
		map.put("searchString", searchString);
		int count = sqlSession.selectOne("getSCount",map);
		return count;
	}
	
	public List<QuestionDTO> searchQuest(String search,String searchString){
		java.util.Map<String,String> map = new java.util.Hashtable<>();
		if(search == null||searchString==null){
			search="";
			searchString="";
		}
		map.put("search", search);
		map.put("searchString", searchString);
		List<QuestionDTO> find = sqlSession.selectList("searchQuest",map);		
		return find;
	}
	
	public List<QuestionDTO> listQuest(int startRow, int endRow) 
	{
		Map<String, Integer> map = new Hashtable<String, Integer>();
		map.put("start" , startRow);
		map.put("end", endRow);
		List<QuestionDTO> list = sqlSession.selectList("listQuest", map);
		
		return list;
	}

	public int insertQuest(QuestionDTO dto) 
	{
		if(dto.getNum()==0){
			Integer max = sqlSession.selectOne("Q_maxNum");
			if(max==null){
				dto.setRe_group(1);
			}else{
				dto.setRe_group(max+1);
			}
		}else{
			java.util.Map<String,Integer> map = new java.util.Hashtable<>();
			map.put("re_step", dto.getRe_step());
			map.put("re_group", dto.getRe_group());
			sqlSession.update("plusRe_step",map);
			dto.setRe_step(dto.getRe_step()+1);
			dto.setRe_level(dto.getRe_level()+1);
		}
		int res = sqlSession.insert("insertQuest",dto);
		return res;
	}
	
	public int Q_plusReadcount(int num)
	{
		int res = sqlSession.update("Q_plusReadcount", num);
		return res;
	}
	
	public QuestionDTO getQuest(int num)
	{
		QuestionDTO dto = sqlSession.selectOne("getQuest", num);
		return dto;
	}
	
	public int deleteQuest(int num) 
	{
		int res = sqlSession.delete("deleteQuest", num);
		return res;
	}

	public int updateQuest(QuestionDTO dto) 
	{
		int res = sqlSession.update("updateQuest", dto);
		return res;
	}
	
	public boolean checkPw(String dbpass,String passwd){
		return dbpass.trim().equals(passwd);
	}
}
