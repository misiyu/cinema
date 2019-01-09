package com.database;

import java.sql.Connection;
import java.sql.Statement;

public class Action {
	protected Connection connection;
	protected Statement statement;
	protected String table; 
	
	public Action(){
		try {
			this.connection = DBConnection.getConnection();
			this.statement = connection.createStatement();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	}
}
