package com.teamb.model;

public class ChatRoomDTO {
	private int chatroom_id;
	private int msgSender;
	private int msgReceiver;
	private String Sname;
	private String Rname;
	
	
	public int getChatroom_id() {
		return chatroom_id;
	}
	public void setChatroom_id(int chatroom_id) {
		this.chatroom_id = chatroom_id;
	}
	public int getMsgSender() {
		return msgSender;
	}
	public void setMsgSender(int msgSender) {
		this.msgSender = msgSender;
	}
	public int getMsgReceiver() {
		return msgReceiver;
	}
	public void setMsgReceiver(int msgReceiver) {
		this.msgReceiver = msgReceiver;
	}
	
	public String getSname() {
		return Sname;
	}
	public void setSname(String sname) {
		Sname = sname;
	}
	public String getRname() {
		return Rname;
	}
	public void setRname(String rname) {
		Rname = rname;
	}
	
	
	
	
}
	
	
	
	