package com.teamb.model;

/*이	   름 : CommTogetherDTO.java
개  발   자 : 최 인 아
설	   명 : 투게더DTO*/

import java.util.Date;

public class CommTogetherDTO {
	
	private int comm_memberNum;
	private int togetherNum;
	private String tname;
	private String ttitle;
	private String temail;
	private String tcontent;
	private Date tregdate;
	private int treadcount;
	
	public int getComm_memberNum() {
		return comm_memberNum;
	}
	public void setComm_memberNum(int comm_memberNum) {
		this.comm_memberNum = comm_memberNum;
	}
	public int getTogetherNum() {
		return togetherNum;
	}
	public void setTogetherNum(int togetherNum) {
		this.togetherNum = togetherNum;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	public String getTtitle() {
		return ttitle;
	}
	public void setTtitle(String ttitle) {
		this.ttitle = ttitle;
	}
	public String getTemail() {
		return temail;
	}
	public void setTemail(String temail) {
		this.temail = temail;
	}
	public String getTcontent() {
		return tcontent;
	}
	public void setTcontent(String tcontent) {
		this.tcontent = tcontent;
	}
	public Date getTregdate() {
		return tregdate;
	}
	public void setTregdate(Date tregdate) {
		this.tregdate = tregdate;
	}
	public int getTreadcount() {
		return treadcount;
	}
	public void setTreadcount(int treadcount) {
		this.treadcount = treadcount;
	}
}
