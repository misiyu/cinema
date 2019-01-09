package com.entity;

public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		SystemUser systemUser=new SystemUser(0, "123456");
		boolean ret =systemUser.login();
		System.out.println(ret);
	}

}
