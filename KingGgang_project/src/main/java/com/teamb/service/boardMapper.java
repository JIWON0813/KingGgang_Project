package com.teamb.service;

import java.util.List;

import com.teamb.model.CommboardDTO;

public interface boardMapper {

	public CommboardDTO getBoard(int boardNum);
	public void plusReadcount(int num);
	public void likeCount(int bNum, int mNum); 
	public boolean isLike(int bNum, int mNum);
	public void warnCount(int bNum, int mNum);
	public boolean isWarn(int bNum, int mNum);
	public int insertBoard(CommboardDTO dto);
	public int writeBoard(CommboardDTO dto);
	public int deleteBoard(int boardNum);
	public int updateBoard(CommboardDTO dto);
	List<CommboardDTO> listBoard(int memberNum);
	public int getCount();
}