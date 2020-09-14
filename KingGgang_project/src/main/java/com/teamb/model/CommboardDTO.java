package com.teamb.model;

public class CommboardDTO {

	private int comm_memberNum; //foreign key
	private int boardNum; //primary key
	private String file_name;
	private int file_size;
	private String content;
	private int readCount;
	private int likeCount;
	private String look;
	

	public int getComm_memberNum() {
		return comm_memberNum;
	}

	public void setComm_memberNum(int comm_memberNum) {
		this.comm_memberNum = comm_memberNum;
	}

	public int getBoardNum() {
		return boardNum;
	}

	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}

	public String getFile_name() {
		return file_name;
	}

	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}

	public int getFile_size() {
		return file_size;
	}

	public void setFile_size(int file_size) {
		this.file_size = file_size;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	

	public int getReadCount() {
		return readCount;
	}

	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}

	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}

	public String getLook() {
		return look;
	}

	public void setLook(String look) {
		this.look = look;
	}
	
}