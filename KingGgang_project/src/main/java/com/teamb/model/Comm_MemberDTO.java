package com.teamb.model;

public class Comm_MemberDTO {
	private int memberNum; // foreign key
	private int comm_memberNum; //primary key
	private String comm_name;
	private String comm_profilename;
	private int comm_profilesize;
	private String comm_nickname;
	private String comm_birth;
	private String comm_intro;
	private int comm_friendCount;
	private String comm_regdate;
	private int unReadCount;
	
	public int getMemberNum() {
		return memberNum;
	}
	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}
	public int getComm_memberNum() {
		return comm_memberNum;
	}
	public void setComm_memberNum(int comm_memberNum) {
		this.comm_memberNum = comm_memberNum;
	}
	public String getComm_name() {
		return comm_name;
	}
	public void setComm_name(String comm_name) {
		this.comm_name = comm_name;
	}
	public String getComm_profilename() {
		return comm_profilename;
	}
	public void setComm_profilename(String comm_profilename) {
		this.comm_profilename = comm_profilename;
	}
	public int getComm_profilesize() {
		return comm_profilesize;
	}
	public void setComm_profilesize(int comm_profilesize) {
		this.comm_profilesize = comm_profilesize;
	}
	public String getComm_nickname() {
		return comm_nickname;
	}
	public void setComm_nickname(String comm_nickname) {
		this.comm_nickname = comm_nickname;
	}
	public String getComm_birth() {
		return comm_birth;
	}
	public void setComm_birth(String comm_birth) {
		this.comm_birth = comm_birth;
	}
	public String getComm_intro() {
		return comm_intro;
	}
	public void setComm_intro(String comm_intro) {
		this.comm_intro = comm_intro;
	}
	public int getComm_friendCount() {
		return comm_friendCount;
	}
	public void setComm_friendCount(int comm_friendCount) {
		this.comm_friendCount = comm_friendCount;
	}
	public String getComm_regdate() {
		return comm_regdate;
	}
	public void setComm_regdate(String comm_regdate) {
		this.comm_regdate = comm_regdate;
	}
	
	
	public int getUnReadCount() {
		return unReadCount;
	}
	public void setUnReadCount(int unReadCount) {
		this.unReadCount = unReadCount;
	}


	public static final int OK = 0;			
	public static final int NOT_ID = 1;	
	public static final int NOT_PW = 2;
	public static final int ERROR = -1;
	
	
}
