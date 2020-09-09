package com.teamb.model;

public class Rentcar_ResDTO {
	
	/*
	이	   름 : Rentcar_ResDTO class
	개  발   자 : 정 우 철
	설	   명 : 렌트카 예약 DTO  
	*/
	
	private int res_id;
	private String member_id;
	private int r_id;
	private int insu_id;
	private String reservationday;
	private String receiptday;
	private String returnday;
	private String pickuptime;
	private int price;
	private int pstatus;
	
	public int getRes_id() {
		return res_id;
	}
	public void setRes_id(int res_id) {
		this.res_id = res_id;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getR_id() {
		return r_id;
	}
	public void setR_id(int r_id) {
		this.r_id = r_id;
	}
	public int getInsu_id() {
		return insu_id;
	}
	public void setInsu_id(int insu_id) {
		this.insu_id = insu_id;
	}
	public String getReservationday() {
		return reservationday;
	}
	public void setReservationday(String reservationday) {
		this.reservationday = reservationday;
	}
	public String getReceiptday() {
		return receiptday;
	}
	public void setReceiptday(String receiptday) {
		this.receiptday = receiptday;
	}
	public String getReturnday() {
		return returnday;
	}
	public void setReturnday(String returnday) {
		this.returnday = returnday;
	}
	public String getPickuptime() {
		return pickuptime;
	}
	public void setPickuptime(String pickuptime) {
		this.pickuptime = pickuptime;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getPstatus() {
		return pstatus;
	}
	public void setPstatus(int pstatus) {
		this.pstatus = pstatus;
	}
	
}
