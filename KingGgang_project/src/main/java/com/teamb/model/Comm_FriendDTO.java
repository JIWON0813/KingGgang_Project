package com.teamb.model;

public class Comm_FriendDTO {
	private int login_comm_memberNum;
	private int friendNum; // ģ���߰��� ����
	private int comm_memberNum; // �ش� ����	
	private String f_name;
	private String f_comm_profilename;
	private int f_comm_profilesize;
	private String f_comm_nickname;
	
	
	public String getF_comm_nickname() {
		return f_comm_nickname;
	}
	public void setF_comm_nickname(String f_comm_nickname) {
		this.f_comm_nickname = f_comm_nickname;
	}
	public int getLogin_comm_memberNum() {
		return login_comm_memberNum;
	}
	public void setLogin_comm_memberNum(int login_comm_memberNum) {
		this.login_comm_memberNum = login_comm_memberNum;
	}
	public int getComm_memberNum() {
		return comm_memberNum;
	}
	public void setComm_memberNum(int comm_memberNum) {
		this.comm_memberNum = comm_memberNum;
	}
	public int getFriendNum() {
		return friendNum;
	}
	public void setFriendNum(int friendNum) {
		this.friendNum = friendNum;
	}
	public String getF_name() {
		return f_name;
	}
	public void setF_name(String f_name) {
		this.f_name = f_name;
	}
	public String getF_comm_profilename() {
		return f_comm_profilename;
	}
	public void setF_comm_profilename(String f_comm_profilename) {
		this.f_comm_profilename = f_comm_profilename;
	}
	public int getF_comm_profilesize() {
		return f_comm_profilesize;
	}
	public void setF_comm_profilesize(int f_comm_profilesize) {
		this.f_comm_profilesize = f_comm_profilesize;
	}
	
	

}