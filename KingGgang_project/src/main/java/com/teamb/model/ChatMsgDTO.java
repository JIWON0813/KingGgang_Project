package com.teamb.model;

import java.util.Date;

import com.google.gson.Gson;

public class ChatMsgDTO {
	
	private int msgId;
	private int chatroom_id;
	private int msgSender;
	private int msgReceiver;
	private String msgContent;
	
	
	public int getMsgId() {
		return msgId;
	}

	public void setMsgId(int msgId) {
		this.msgId = msgId;
	}

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

	public String getMsgContent() {
		return msgContent;
	}

	public void setMsgContent(String msgContent) {
		this.msgContent = msgContent;
	}

	public static ChatMsgDTO convertMessage(String source) {
		ChatMsgDTO message = new ChatMsgDTO();
		Gson gson = new Gson();
		message = gson.fromJson(source,  ChatMsgDTO.class);
		return message;
	}

	@Override
	public String toString() {
		return "ChatMsgDTO [msgId=" + msgId + ", chatroom_id=" + chatroom_id + ", msgSender=" + msgSender
				+ ", msgReceiver=" + msgReceiver + ", msgContent=" + msgContent + "]";
	}

	
	

	
	
	
	

}
