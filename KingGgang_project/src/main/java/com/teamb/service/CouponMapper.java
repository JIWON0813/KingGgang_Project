package com.teamb.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamb.model.CouponDTO;
import com.teamb.model.MemberDTO;

/*
이	   름 : CouponMapper class
개  발   자 : 박 준 언
설	   명 : 쿠폰 매퍼  
*/

@Service
public class CouponMapper {

	@Autowired
	private SqlSession sqlSession;
	
	public int insertCoupon(CouponDTO dto){
		int res = sqlSession.insert("insertCoupon",dto);
		return res;
	}
	public List<CouponDTO> couponList(){
		List<CouponDTO> list = sqlSession.selectList("couponList");
		return list;
	}
	public int deleteCoupon(int no){
		int res = sqlSession.delete("deleteCoupon",no);
		return res;
	}
	public int updateCoupon(CouponDTO dto){
		int res = sqlSession.update("updateCoupon",dto);
		return res;
	}
	public CouponDTO getCoupon(int no){
		CouponDTO dto = sqlSession.selectOne("getCoupon",no);
		return dto;
	}
	public List<MemberDTO> memberList(){
		List<MemberDTO> list = sqlSession.selectList("memberli");
		return list;
	}
	public int regCoupon(CouponDTO dto){
		int res = sqlSession.update("regCoupon",dto);
		return res;
	}
}
