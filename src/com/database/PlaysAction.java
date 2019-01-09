package com.database;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class PlaysAction extends Action{
	public PlaysAction()
	{
		super();
		this.table = "plays";
	}
	
	public ResultSet getPlayInformation()
	{
		ResultSet resultSet=null;
		Date day = new Date();
		SimpleDateFormat dForma = new SimpleDateFormat("yyyy-MM-dd");
//		dForma.format(day)
		String sql="select movie_id,start_time from "+this.table+" order by movie_id,start_time;";
		try {
			resultSet=statement.executeQuery(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return resultSet;
	}
	public ResultSet getMovieShowtime(int movieid)
	{
		ResultSet resultSet=null;
		String sql="select movie_id,start_time from "+this.table+" where movie_id= "
						+movieid+" order by start_time;";
		try {
			resultSet=statement.executeQuery(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return resultSet;
	}
	public String getFirsday(int movieid)
	{
		ResultSet resultSet=null;
		String datetime =null;
		String sql="select distinct start_time from plays "
				+ "where start_time=(select min(start_time) from plays) and movie_id="+movieid+";";
		try {
			resultSet=statement.executeQuery(sql);
			if(resultSet.next())
				datetime= resultSet.getString(1);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(resultSet==null)
			return null;
		//System.out.println("=================="+datetime);
		String date = datetime.substring(0,10);
		
		return date;
	}
}
