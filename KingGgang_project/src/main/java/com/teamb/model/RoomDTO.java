package com.teamb.model;

public class RoomDTO {
	private int id;
	private String name;
	private int maxpersons;
	private int dayprice;
	private int endprice;
	private String content;
	private String filename;
	private int filesize;
	private int h_id;
	
	
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public int getFilesize() {
		return filesize;
	}
	public void setFilesize(int filesize) {
		this.filesize = filesize;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getMaxpersons() {
		return maxpersons;
	}
	public void setMaxpersons(int maxpersons) {
		this.maxpersons = maxpersons;
	}
	public int getDayprice() {
		return dayprice;
	}
	public void setDayprice(int dayprice) {
		this.dayprice = dayprice;
	}
	public int getEndprice() {
		return endprice;
	}
	public void setEndprice(int endprice) {
		this.endprice = endprice;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getH_id() {
		return h_id;
	}
	public void setH_id(int h_id) {
		this.h_id = h_id;
	}
	
	
}