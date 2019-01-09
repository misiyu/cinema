package com.database;

import java.sql.ResultSet;
import java.sql.SQLException;

public class SeatAction extends Action{
	public SeatAction() {
		super();
		this.table = "seats";
	}
	
	public ResultSet getAllUnavailable(int mhall_id,int movieid ,String starttime) throws SQLException
	{
		ResultSet resultSet =null;
		System.out.println("==================="+starttime);
		String sql="select distinct seats.id from seats,tickets where seats.id = tickets.seat_id and movie_id="
				+movieid+ " and start_time='"+starttime+"';";
		resultSet = statement.executeQuery(sql);
		return resultSet;
	}
}
