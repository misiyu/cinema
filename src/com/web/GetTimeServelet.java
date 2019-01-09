package com.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.database.PlaysAction;


@WebServlet("/gettimeservelet")
public class GetTimeServelet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int movie_id =Integer.parseInt (request.getParameter("movie"));
		movie_id++;
		PlaysAction playsAction =new PlaysAction();
//		ResultSet resultSet = playsAction.getMovieShowtime(movie_id);
		String respondText = "";
//		String dateTemp ="";
//		if(resultSet == null)
//			return ;
//		try {
//			if(resultSet.next())
//				dateTemp = respondText = resultSet.getString(1).substring(0,10);
//			respondText+= resultSet.getString(1).substring(11,16);
//			while(resultSet.next())
//			{
//				String temp1 = resultSet.getString(1).substring(0,10);
//				String temp2 = resultSet.getString(1).substring(11,16);
//				if(temp1 != dateTemp)
//				{
//					respondText += "|";
//					dateTemp = temp1;
//				}
//				else
//					respondText += ",";
//				respondText += temp2;
//			}
//			
//		} catch (Exception e) {
//			// TODO: handle exception
//		}
		respondText = playsAction.getFirsday(movie_id);
		//System.out.println(respondText);
		PrintWriter out = response.getWriter();
		out.println(respondText);
		out.flush();
		out.close();
	}
	
}
