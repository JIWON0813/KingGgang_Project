package com.teamb.model;

public class Comm_FriendDTO {
	private int login_comm_memberNum;
	private int friendNum; // ģ���߰��� ����
	private int comm_memberNum; // �ش� ����	
	private String f_name;
	
	
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
	
	

}