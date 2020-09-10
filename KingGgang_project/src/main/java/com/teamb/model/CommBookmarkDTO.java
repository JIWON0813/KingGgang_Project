package com.teamb.model;

public class CommBookmarkDTO {

	private	int boardNum;
	private int comm_memberNum;
	private int bookmarkNum;
	private String cm_file_name;
	private int cm_file_size;
	
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
	public int getBookmarkNum() {
		return bookmarkNum;
	}
	public void setBookmarkNum(int bookmarkNum) {
		this.bookmarkNum = bookmarkNum;
	}
	public String getCm_file_name() {
		return cm_file_name;
	}
	public void setCm_file_name(String cm_file_name) {
		this.cm_file_name = cm_file_name;
	}
	public int getCm_file_size() {
		return cm_file_size;
	}
	public void setCm_file_size(int cm_file_size) {
		this.cm_file_size = cm_file_size;
	}
}