package com.teamb.model;
/*
 	김지원
  	관리자모드 결제 목록
 
 */
public class PaymentListData{
	int no;
	String p_name;
	int type;
	String hp;
	String id;
	String m_name;
	String email;
	String startDate;
	String endDate;
	int price;
	String payDate;
	String filename;
	
	public PaymentListData(PaymentDTO pdto, MemberDTO mdto, RoomDateDTO rddto, RoomDTO rdto, HotelDTO hdto, Rentcar_ResDTO resdto, RentcarDTO cardto) {
		if(pdto.getType() == 1){
			this.no = pdto.getNo();
			this.p_name = hdto.getName() + " " + rdto.getName();
			this.type = pdto.getType();
			this.hp = hdto.getHp();
			this.id = mdto.getId();
			this.m_name = mdto.getName();
			this.email = mdto.getEmail();
			this.startDate = rddto.getStartdate();
			this.endDate = rddto.getEnddate();
			this.price = pdto.getPrice();
			this.payDate = pdto.getPaydate();
			this.filename = rdto.getFilename();
		}
		else{
			this.no = pdto.getNo();
			this.p_name = cardto.getName();
			this.type = pdto.getType();
			this.hp = cardto.getRenttel();
			this.id = mdto.getId();
			this.m_name = mdto.getName();
			this.email = mdto.getEmail();
			this.startDate = resdto.getReceiptday();
			this.endDate = resdto.getReturnday();
			this.price = pdto.getPrice();
			this.payDate = pdto.getPaydate();
			this.filename = cardto.getFilename();
		}
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public String getHp() {
		return hp;
	}

	public void setHp(String hp) {
		this.hp = hp;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getPayDate() {
		return payDate;
	}

	public void setPayDate(String payDate) {
		this.payDate = payDate;
	}
	
	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	
	
	
}