package com.teamb.model;

public class CommWarnDTO {
	
	private int boardNum;
	private int comm_memberNum;
	private int warnNum;
	private String w_comm_nickname;
	
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
	public String getW_comm_nickname() {
		return w_comm_nickname;
	}
	public void setW_comm_nickname(String w_comm_nickname) {
		this.w_comm_nickname = w_comm_nickname;
	}
}