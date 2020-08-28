package com.teamb.service;

import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
		if (dto.getNum()==0)
		{
			Integer num = sqlSession.selectOne("Q_maxNum");
			
			if (num == null)
			{
				dto.setRe_group(1);
			}
			else 
			{
				dto.setRe_group(num + 1);
			}
		}
		else 
		{
			Map<String, Integer> map = new Hashtable<String, Integer>();
			map.put("re_step", dto.getRe_step());
			map.put("re_group", dto.getRe_group());
			
			int res = sqlSession.update("plusRe_step", map);
			dto.setRe_step(dto.getRe_step() + 1);
			dto.setRe_level(dto.getRe_level() + 1);
		}
		
		//System.out.println("a="+dto.getA_passwd() + " b="+dto.getIp() + " c="+dto.getContent() + " d="+dto.getNum() + " e="+dto.getRe_group());
		//System.out.println(" f="+dto.getRe_level() + " g="+dto.getRe_step() + " h="+dto.getReadcount() + " i="+dto.getReg_date() + " j="+dto.getSubject());
		
		int res = sqlSession.insert("insertQuest", dto);
		
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

	public  boolean isId(int num, String m_id)
	{
		String dbPass = sqlSession.selectOne("isId", num);
		if (dbPass.equals(m_id))
		//전송받은 로그인된 아이디와 게시글 번호에 저장된 아이디값 비교
		{
			return true;
		}
		else
		{
			return false;
		}
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

}
