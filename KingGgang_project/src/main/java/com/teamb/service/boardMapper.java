package com.teamb.service;

import java.util.List;

import com.teamb.model.B4_boardDTO;

public interface boardMapper {

	public B4_boardDTO getBoard(int boardNum);
	public void plusReadcount(int num);
	public void likeCount(int bNum, int mNum); 
	public boolean isLike(int bNum, int mNum);
	public void warnCount(int bNum, int mNum);
	public boolean isWarn(int bNum, int mNum);
	public int insertBoard(B4_boardDTO dto);
	public int writeBoard(B4_boardDTO dto);
	public int deleteBoard(int boardNum);
	public int updateBoard(B4_boardDTO dto);
	List<B4_boardDTO> listBoard(int memberNum);
	public int getCount();
}