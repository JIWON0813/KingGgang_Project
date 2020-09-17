package com.teamb.model;
 
	/*��	   �� : CommRelyDTO.java
	��  ��   �� : �� �� ��
	��	   �� : ���DTO*/

import java.util.Date;

public class CommReplyDTO {
	
	private int boardNum;
	private int replyNum;
	private String rcontent;
	private String rwriter;
	private Date rregdate;
	private String rpasswd;
	
	public int getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}
	public int getReplyNum() {
		return replyNum;
	}
	public void setReplyNum(int replyNum) {
		this.replyNum = replyNum;
	}
	public String getRcontent() {
		return rcontent;
	}
	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}
	public String getRwriter() {
		return rwriter;
	}
	public void setRwriter(String rwriter) {
		this.rwriter = rwriter;
	}
	public Date getRregdate() {
		return rregdate;
	}
	public void setRregdate(Date rregdate) {
		this.rregdate = rregdate;
	}
	public String getRpasswd() {
		return rpasswd;
	}
	public void setRpasswd(String rpasswd) {
		this.rpasswd = rpasswd;
	}

}
