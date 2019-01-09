package com.entity;
/*
 * add More information
 */
import java.sql.ResultSet;
import java.sql.SQLException;

import com.database.UserAction;

public class User {
	private int ID=0;
	private String userName=null;
	private String email=null;
	private String password=null;
	private String registerTime=null;
	private  char grade='A';
	private double money=0.0;
	private int isSystemAdmin=0;
	private boolean isroot=false;
	public boolean isIsroot() {
		return isroot;
	}
	public int isSystemAdmin() {
		return isSystemAdmin;
	}
	public int getID() {
		return ID;
	}
	public String getUserName() {
		return userName;
	}
	public String getEmail() {
		return email;
	}
	public String getPassword() {
		return password;
	}
	public String getRegisterTime() {
		return registerTime;
	}
	
	public char getGrade() {
		return grade;
	}
	public double getMoney() {
		return money;
	}
	public void setGrade(char grade) {
		this.grade = grade;
	}
	public void setMoney(double money) {
		this.money = money;
	}
	
	private UserAction userAction=new UserAction();
	public User( String userName, String email, String password, String registerTime,boolean isSystemAdmin) {
		this.userName = userName;
		this.email = email;
		this.password = password;
		this.registerTime = registerTime;
		this.isroot = isSystemAdmin;
	}
	public User(String email, String password) {
		this.email = email;
		this.password = password;
	}
	public User() {
		
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	public void setID(int iD) {
		ID = iD;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setSystemAdmin(int isSystemAdmin) {
		this.isSystemAdmin = isSystemAdmin;
	}
	
	public String getUserAdmin() {
		if(isSystemAdmin>0)
			return("Admin");
		return("User");
		
	}
	public int getIsSystemAdmin() {
		return isSystemAdmin;
	}
	public void setRegisterTime(String registerTime) {
		this.registerTime = registerTime;
	}
	public boolean login(){
		ResultSet resultSet=userAction.findUserByEmail(this.email);
		
		try {
			if(resultSet!=null && resultSet.next()){
				do {
					if(resultSet.getString(1).equals(this.password))
					{
						this.ID = resultSet.getInt(3);
						if(resultSet.getInt(2)==1)
							this.isroot=true;
						return true;
					}
				} while (resultSet.next());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean hasRegistered(){
		ResultSet resultSet=userAction.findUserByEmail(this.email);
		try {
			if(resultSet.next())
				return true;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return false;
	}
	public boolean register(){
		userAction.addUser(this);
		return true;
	}
	
	
}
