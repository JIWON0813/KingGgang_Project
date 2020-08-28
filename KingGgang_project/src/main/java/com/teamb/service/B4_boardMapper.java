package com.teamb.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamb.model.B4_boardDTO;
@Service
public class B4_boardMapper implements boardMapper {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public B4_boardDTO getBoard(int boardNum) {
		return sqlSession.selectOne("getBoard",boardNum);    
	}
	

	@Override
	public void plusReadcount(int num) {
		sqlSession.update("plusReadcount", num);
		sqlSession.commit();
		return;
	}

	@Override
	public void likeCount(int bNum,int mNum) {
		java.util.Map<String,Integer> map = new java.util.Hashtable<String,Integer>();
		map.put("bNum", bNum);
		map.put("mNum", mNum);
		if(isLike(bNum,mNum)){
			sqlSession.update("plusLikecount",bNum);
			sqlSession.update("plusIsLikecount",map);
		}else{
			sqlSession.update("minusLikecount",bNum);
			sqlSession.update("plusIsLikecount",map);
		}
		sqlSession.commit();
	}
	
	public boolean isLike(int bNum, int mNum){
		java.util.Map<String,Integer> map = new java.util.Hashtable<String,Integer>();
		map.put("bNum", bNum);
		map.put("mNum", mNum);
		int res=sqlSession.selectOne("isLike", map);
		if(res%2==0)return true;
		else return false;
	}


	@Override
	public void warnCount(int bNum, int mNum) {
		
	}
	
	public boolean isWarn(int bNum, int mNum){
		return true;
	}

	@Override
	public int insertBoard(B4_boardDTO dto) {
		int res = sqlSession.insert("insertBoard", dto);
		return res;
	}
	
	@Override
	public int writeBoard(B4_boardDTO dto) {
		return sqlSession.insert("writeBoard",dto);
	}

	@Override
	public int deleteBoard(int boardNum) {	

		int res = sqlSession.insert("deleteBoard",boardNum);
		return res;
	}

	@Override
	public int updateBoard(B4_boardDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	public List<B4_boardDTO> listBoard(int memberNum) {
		return sqlSession.selectList("listBoard",memberNum);
	}
	
	public List<B4_boardDTO> allListBoard() {
		return sqlSession.selectList("allListBoard");

	}

	@Override
	public int getCount() {
		// TODO Auto-generated method stub
		return 0;
	}

}