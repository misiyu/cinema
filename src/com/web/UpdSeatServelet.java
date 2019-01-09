package com.web;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.database.OrderAction;
import com.database.TickectAction;
import com.entity.Order;

@WebServlet("/updseat")
public class UpdSeatServelet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int seatId1 = Integer.parseInt(request.getParameter("seat1"));
		int seatId2 = Integer.parseInt(request.getParameter("seat2"));
		int seatId3 = Integer.parseInt(request.getParameter("seat3"));
		int seatId4 = Integer.parseInt(request.getParameter("seat4"));
		int seatId5 = Integer.parseInt(request.getParameter("seat5"));
		int movieID = Integer.parseInt(request.getParameter("movie"));
		String datetime = request.getParameter("datetime");
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String year = (df.format(new Date())).substring(0,5);
		datetime = year+datetime;
		
		//System.out.println(datetime);
		movieID++;
		System.out.println("userid================="+request.getSession().getAttribute("userid4"));
		
		TickectAction tickectAction = new TickectAction();
		OrderAction aOrderAction = new OrderAction();
		System.out.println(movieID);
		int userid = (int) request.getSession().getAttribute("userid4");
		int randNum = (int) (Math.random()*1000000) +1;
		String ticket_key = randNum+""+userid;
		if(seatId1 != 0)
		{
			aOrderAction.insertNew(ticket_key, userid, 1);
			tickectAction.addOneTicket(seatId1, movieID,datetime);
			int tid = tickectAction.getMAxid();
			aOrderAction.insertOrderTicket(tid, ticket_key);
		}
		if(seatId2 != 0)
		{
			tickectAction.addOneTicket(seatId2, movieID,datetime);
			int tid = tickectAction.getMAxid();
			aOrderAction.insertOrderTicket(tid, ticket_key);
		}
		if(seatId3 != 0)
		{
			tickectAction.addOneTicket(seatId3, movieID,datetime);
			int tid = tickectAction.getMAxid();
			aOrderAction.insertOrderTicket(tid, ticket_key);
		}
		if(seatId4 != 0)
		{
			tickectAction.addOneTicket(seatId4, movieID,datetime);
			int tid = tickectAction.getMAxid();
			aOrderAction.insertOrderTicket(tid, ticket_key);
		}
		if(seatId5 != 0)
		{
			tickectAction.addOneTicket(seatId5, movieID,datetime);
			int tid = tickectAction.getMAxid();
			aOrderAction.insertOrderTicket(tid, ticket_key);
		}
			
	}
	
}
