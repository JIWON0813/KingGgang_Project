package com.teamb.model;

public class Comm_MemberDTO {
	private int memberNum; // foreign key
	private int comm_memberNum; //primary key
	private String comm_name;
	private String comm_profile_name;
	private int comm_profile_size;
	private String comm_nickname;
	private String comm_birth;
	private String comm_intro;
	private int comm_friendCount;
	private int comm_regdate;
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
	public String getComm_profile_name() {
		return comm_profile_name;
	}
	public void setComm_profile_name(String comm_profile_name) {
		this.comm_profile_name = comm_profile_name;
	}
	public int getComm_profile_size() {
		return comm_profile_size;
	}
	public void setComm_profile_size(int comm_profile_size) {
		this.comm_profile_size = comm_profile_size;
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
	public int getComm_regdate() {
		return comm_regdate;
	}
	public void setComm_regdate(int comm_regdate) {
		this.comm_regdate = comm_regdate;
	}
	
	public static final int OK = 0;			
	public static final int NOT_ID = 1;	
	public static final int NOT_PW = 2;
	public static final int ERROR = -1;
	
	
}
