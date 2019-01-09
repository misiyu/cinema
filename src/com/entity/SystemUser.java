package com.entity;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.database.SystemUserAction;

public class SystemUser {
	
	private int workId=0;
	private String name=null;
	private String password=null;
	private String email=null;
	private String phone=null;
	private String idCard=null;
	
	private SystemUserAction systemUserAction=new SystemUserAction();;
	
	public SystemUser(int workId,String name,String password){
		this.workId = workId;
		this.name = name;
		this.password = password;
	}
	
	public SystemUser(int workId, String name, String password, String email,
			String phone, String idCard) {
		this.workId = workId;
		this.name = name;
		this.password = password;
		this.email = email;
		this.phone = phone;
		this.idCard = idCard;
	}

	public SystemUser(int workId,String password){
		this.workId = workId;
		this.name = null;
		this.password = password;
	}
	
	public boolean login(){
		ResultSet resultSet=systemUserAction.findUserByWorkId(workId);
		if(resultSet==null)
			return false;
		try {
			while(resultSet.next()){
				if(resultSet.getString(1).equals(this.password))
					return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	public int getId() {
		return workId;
	}

	public String getName() {
		return name;
	}

	public String getPassword() {
		return password;
	}
	public String getEmail() {
		return email;
	}

	public String getPhone() {
		return phone;
	}

	public String getIdCard() {
		return idCard;
	}
}
