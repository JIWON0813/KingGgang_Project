package com.teamb.model;

public class RoomDateDTO {
	
	int id;
	String startdate;
	String enddate;
	int totalprice;
	String m_id;
	int room_id;
	int valid;
	
	
	
	
	public RoomDateDTO() {
	}
	
	
	
	public RoomDateDTO(String startdate, String enddate, int totalprice, String m_id, int room_id, int valid) {
		super();
		this.startdate = startdate;
		this.enddate = enddate;
		this.totalprice = totalprice;
		this.m_id = m_id;
		this.room_id = room_id;
		this.valid = valid;
	}



	public int getTotalprice() {
		return totalprice;
	}
	public void setTotalprice(int totalprice) {
		this.totalprice = totalprice;
	}
	public int getValid() {
		return valid;
	}
	public void setValid(int valid) {
		this.valid = valid;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getStartdate() {
		return startdate;
	}
	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}
	public String getEnddate() {
		return enddate;
	}
	public void setEnddate(String enddate) {
		this.enddate = enddate;
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
