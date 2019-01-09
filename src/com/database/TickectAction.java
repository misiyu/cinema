package com.database;

import java.sql.ResultSet;
import java.sql.SQLException;

public class TickectAction extends Action{
	public TickectAction() {
		super();
		this.table="tickets";
	}
	
	public void addOneTicket(int seatid,int movieid,String start_time)
	{
		String sql="insert into tickets (movie_id,seat_id,price,start_time) values ("
					+movieid+","+seatid+",50,'"+start_time+"');";
		try {
			statement.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public int getMAxid()
	{
		int id = 0;
		String sql="select id from tickets where id =(select max(id) from tickets);";
		ResultSet resultSet = null;
		try {
			resultSet=statement.executeQuery(sql);
			if(resultSet.next())
				id = resultSet.getInt(1);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return id;
	}
}
