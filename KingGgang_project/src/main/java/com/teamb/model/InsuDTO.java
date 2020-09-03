package com.teamb.model;

public class InsuDTO {
	
	/*
	이	   름 : InsuDTO class
	개  발   자 : 정 우 철
	설	   명 : 렌트카 보험 DTO  
	*/
	
	
	private int id;
	private String name;
	private int price;
	private String company;
	
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
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	
}