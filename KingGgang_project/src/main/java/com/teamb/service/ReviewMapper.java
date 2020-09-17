package com.teamb.service;

import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamb.model.ReviewDTO;



@Service
public class ReviewMapper {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<ReviewDTO> listReview(int startRow, int endRow) 
	{
		Map<String, Integer> map = new Hashtable<String, Integer>();
		map.put("start" , startRow);
		map.put("end", endRow);
		List<ReviewDTO> list = sqlSession.selectList("listReview", map);
		
		return list;
	}

	public int getCount() 
	{
		int count = sqlSession.selectOne("reviewCount");
		return count;
	}
	
	public int insertReview(ReviewDTO dto){
		int res = sqlSession.insert("insertReview",dto);
		return res;
	}
	
	public int deleteReview(int num){
		int res = sqlSession.delete("deleteReview",num);
		return res;
	}
	
	public ReviewDTO getReview(int num){
		ReviewDTO dto = sqlSession.selectOne("getReview",num);
		return dto;
	}
	
	public int updateReview(ReviewDTO dto){
		int res = sqlSession.update("updateReview",dto);
		return res;
	}
}
