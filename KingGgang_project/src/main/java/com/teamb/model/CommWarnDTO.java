package com.teamb.model;

public class CommWarnDTO {
	
	private int boardNum;
	private int memberNum;
	private int warnNum;
	private String wname;
	
	public int getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}
	public int getMemberNum() {
		return memberNum;
	}
	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}
	public int getWarnNum() {
		return warnNum;
	}
	public void setWarnNum(int warnNum) {
		this.warnNum = warnNum;
	}
	public String getWname() {
		return wname;
	}
	public void setWname(String wname) {
		this.wname = wname;
	}
}