package com.teamb.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamb.model.CommBookmarkDTO;
import com.teamb.model.CommLikeDTO;
import com.teamb.model.WishlistDTO;

@Service
public class CommLikeMapper {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List <CommLikeDTO> getCommLike(CommLikeDTO cdto) {
		return sqlSession.selectList("getLikeNum", cdto);
	}
	
	public int insertLike(CommLikeDTO cdto) {
		int res = sqlSession.insert("insertLike",cdto);
		return res;
	}
	
	public int deleteLike(CommLikeDTO cdto) {
		int res = sqlSession.delete("deleteLike",cdto);
		return res;
	}
	
	public int plusLikeCount(int boardNum) {
		int res1 = sqlSession.update("plusLikeCount",boardNum);
		return res1;
	}
	
	public int minusLikeCount(int boardNum) {
		int res1 = sqlSession.update("minusLikeCount",boardNum);
		return res1;
	}
	
	public int getLikeCount(int boardNum) {
		int likeCount = sqlSession.selectOne("getLikeCount",boardNum);
		return likeCount;
	}
}
