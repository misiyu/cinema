package com.database;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

	private static String dbUrl="jdbc:mysql://localhost:3306/cinema?"
			+"user=root&password=gjl13008470077&useUnicode=true&characterEncoding=UTF8";;
	
	public DBConnection() {
	}
	public static Connection getConnection()throws Exception{
		Connection connection=null;
		Class.forName("com.mysql.jdbc.Driver");
		connection = DriverManager.getConnection(dbUrl);
		if(connection == null){
			System.out.println("connection to database fail");
		}else{
			System.out.println("connection to database success");
		}
		return connection;
	}
}
