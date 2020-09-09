package com.teamb.model;
 
	/*이	   름 : CommRelyDTO.java
	개  발   자 : 최 인 아
	설	   명 : 댓글DTO*/

import java.util.Date;

public class CommReplyDTO {
	
	private int boardNum;
	private int replyNum;
	private String rcontent;
	private String rwriter;
	private Date rregdate;
	
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

}
