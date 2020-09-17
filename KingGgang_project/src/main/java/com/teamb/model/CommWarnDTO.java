package com.teamb.model;

public class CommWarnDTO {
	
	private int boardNum;
	private int comm_memberNum;
	private int warnNum;
	private String wname;
	
	public int getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}
	public int getComm_memberNum() {
		return comm_memberNum;
	}
	public void setComm_memberNum(int comm_memberNum) {
		this.comm_memberNum = comm_memberNum;
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