package com.teamb.model;

public class Comm_FriendDTO {
	private int friendNum; // ģ���߰��� ����
	private int memberNum; // �ش� ����
	private String f_profile_name;
	private int f_profile_size;
	private String f_name;
	private String f_id;
	private String f_email;
	
	public int getMemberNum() {
		return memberNum;
	}
	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
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
	public String getF_id() {
		return f_id;
	}
	public void setF_id(String f_id) {
		this.f_id = f_id;
	}
	public String getF_email() {
		return f_email;
	}
	public void setF_email(String f_email) {
		this.f_email = f_email;
	}
	public String getF_profile_name() {
		return f_profile_name;
	}
	public void setF_profile_name(String f_profile_name) {
		this.f_profile_name = f_profile_name;
	}
	public int getF_profile_size() {
		return f_profile_size;
	}
	public void setF_profile_size(int f_profile_size) {
		this.f_profile_size = f_profile_size;
	}
	
	

}