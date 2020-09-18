package com.teamb.service;

import java.util.List; 




import org.apache.ibatis.session.SqlSession;





import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamb.model.HotelDTO;
import com.teamb.model.RentcarDTO;
import com.teamb.model.WishlistDTO;

/*
이	   름 : WishlistMapper.java
개  발   자 : 원세호
설	   명 : 관심리스트 	Mapper
*/
@Service
public class WishlistMapper {
	
	@Autowired	
	private SqlSession sqlSession;
	
	public int insertWish(WishlistDTO dto) {
		int res = sqlSession.insert("insertWish",dto);
		return res;
	}
	
	public List<WishlistDTO> getWishlist(int m_no) {
		return sqlSession.selectList("getWish",m_no);
	}
	
	public HotelDTO getHotellist(int f_no) {
		return sqlSession.selectOne("getwishHotel",f_no);
	}

	public RentcarDTO getRentlist(int f_no) {
		return sqlSession.selectOne("getwishRent",f_no);
	}
	
	public int deleteWish(WishlistDTO dto) {
		int res = sqlSession.delete("deleteWish",dto);
		return res;
	}
	
	public List<WishlistDTO> getNolist(WishlistDTO wdto) {
		return sqlSession.selectList("getwishNo",wdto);
	}
	
}	
	
	
	
	
	
	
	
	
	
	
	
	
	

