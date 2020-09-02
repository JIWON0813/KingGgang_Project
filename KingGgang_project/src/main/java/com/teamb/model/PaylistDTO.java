package com.teamb.model;

public class PaylistDTO {
	//rentcar
	private String r_name;
	private String r_company;
	private String r_type;
	//hotel
	private String h_name;
	private String h_category;
	private String h_hp;
	//pay
	private int p_price;
	private int p_amount;
	private String p_paydate;
	private int p_type;
	private int p_valid;
	//member
	private int m_no;
	private String m_id;
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	private String m_name;
	private String m_email;
	private String m_hp;
	
	public int getP_type() {
		return p_type;
	}
	public void setP_type(int p_type) {
		this.p_type = p_type;
	}
	public int getP_valid() {
		return p_valid;
	}
	public void setP_valid(int p_valid) {
		this.p_valid = p_valid;
	}
	public String getR_name() {
		return r_name;
	}
	public void setR_name(String r_name) {
		this.r_name = r_name;
	}
	public String getR_company() {
		return r_company;
	}
	public void setR_company(String r_company) {
		this.r_company = r_company;
	}
	public String getR_type() {
		return r_type;
	}
	public void setR_type(String r_type) {
		this.r_type = r_type;
	}
	public String getH_name() {
		return h_name;
	}
	public void setH_name(String h_name) {
		this.h_name = h_name;
	}
	public String getH_category() {
		return h_category;
	}
	public void setH_category(String h_category) {
		this.h_category = h_category;
	}
	public String getH_hp() {
		return h_hp;
	}
	public void setH_hp(String h_hp) {
		this.h_hp = h_hp;
	}
	public int getP_price() {
		return p_price;
	}
	public void setP_price(int p_price) {
		this.p_price = p_price;
	}
	public int getP_amount() {
		return p_amount;
	}
	public void setP_amount(int p_amount) {
		this.p_amount = p_amount;
	}
	public String getP_paydate() {
		return p_paydate;
	}
	public void setP_paydate(String p_paydate) {
		this.p_paydate = p_paydate;
	}
	public int getM_no() {
		return m_no;
	}
	public void setM_no(String m_id) {
		this.m_no = m_no;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_email() {
		return m_email;
	}
	public void setM_email(String m_email) {
		this.m_email = m_email;
	}
	public String getM_hp() {
		return m_hp;
	}
	public void setM_hp(String m_hp) {
		this.m_hp = m_hp;
	}
	
	
}