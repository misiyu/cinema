package com.entity;

public class Order {
	
	private String get_ticket_key;
	private String oder_time;	
	private int  ticket_state;
	private int userid;
	private int  dicountid;
	
	public Order() {
		// TODO Auto-generated constructor stub
	}
	
	public int getDicountid() {
		return dicountid;
	}
	public String getGet_ticket_key() {
		return get_ticket_key;
	}
	public String getOder_time() {
		return oder_time;
	}
	public int getTicket_state() {
		return ticket_state;
	}
	public int getUserid() {
		return userid;
	}
	
	public void setGet_ticket_key(String get_ticket_key) {
		this.get_ticket_key = get_ticket_key;
	}
	public void setOder_time(String oder_time) {
		this.oder_time = oder_time;
	}
	public void setTicket_state(int ticket_state) {
		this.ticket_state = ticket_state;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public void setDicountid(int dicountid) {
		this.dicountid = dicountid;
	}
	
	
	
	
	
	
	

}
