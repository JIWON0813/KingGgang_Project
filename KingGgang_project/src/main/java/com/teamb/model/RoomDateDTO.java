package com.teamb.model;

public class RoomDateDTO {
	String startdate;
	String enddate;
	String m_id;
	int room_id;
	
	public String getStart() {
		return startdate;
	}
	public void setStart(String start) {
		this.startdate = start;
	}
	public String getEnd() {
		return enddate;
	}
	public void setEnd(String end) {
		this.enddate = end;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public int getRoom_id() {
		return room_id;
	}
	public void setRoom_id(int room_id) {
		this.room_id = room_id;
	}
	
	
}
