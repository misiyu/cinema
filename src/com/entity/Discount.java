package com.entity;

public class Discount {
	private int id;
	private String  name;
	private double discount_rate;
	
	public Discount() {
		// TODO Auto-generated constructor stub
	}
	public void setDiscount_rate(double discount_rate) {
		this.discount_rate = discount_rate;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public double getDiscount_rate() {
		return discount_rate;
	}
	public int getId() {
		return id;
	}
	public String getName() {
		
		return name;
	}

}
