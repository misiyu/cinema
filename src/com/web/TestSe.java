package com.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.database.SeatAction;

@WebServlet("/test1")
public class TestSe extends HttpServlet{

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int movieid = Integer.parseInt(request.getParameter("movie_id"));
		movieid++;
		int mhall_id = Integer.parseInt(request.getParameter("mhall_id"));
		String time = request.getParameter("starttime");
		String date = request.getParameter("date");
		
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String year = (df.format(new Date())).substring(0,5);
		String datetime = year+date+" "+time;
		
		int aa = movieid+6;
		request.getSession().setAttribute("aa", aa);
		SeatAction seatAction = new SeatAction();
		ResultSet resultSet =null;
		try {
//			System.out.println("================"+movieid);
			resultSet = seatAction.getAllUnavailable(mhall_id, movieid,datetime);
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String respondTest="";
		int temp = 0;
		if(resultSet != null)
		{
			try {
				while(resultSet.next())
				{
					temp = resultSet.getInt(1);
					//System.out.println(temp);
					respondTest = respondTest+ temp+"|";
				}
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
		//System.out.println(unavailableId[0]);
		//respondTest = "1|2|3|4|5";
		PrintWriter out = response.getWriter();
		out.println(respondTest);
		out.flush();
		out.close();
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(request, response);
	}
}
