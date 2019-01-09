package com.database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.Map;

import com.entity.Order;
import com.support.Page;
import com.support.ResourceClose;

public class OrderAction extends Action {
	static public int sizepage = 5;
	
	public OrderAction() {
		super();
		this.table=" orders";
	}
	public void insertNew(String ticket_key,int userid,int discountid)
	{
		String sql = "insert into orders (get_ticket_key,userid,dicountid) values ('"
					+ticket_key+"',"+userid+","+discountid+");";
		System.out.println(sql);
		try {
			statement.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void insertOrderTicket(int tid,String ticket_key)
	{
		String sql="insert into order_ticket (ticketid,get_ticket_key) values ("+tid+",'"+ticket_key+"')";
		try {
			statement.executeUpdate(sql);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	public Map findAllorder(int perPage) {
		 Order order = null;		
		LinkedList list = new LinkedList();
		
		ResultSet rs=null;
		ResultSet r=null;
		Statement pstmt=null;
		Page page = null;
		Map map = null;
		
		try{
			System.out.println("begin in orders");
			String sql = new String("select * from orders order by oder_time;");
			pstmt=connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			PreparedStatement ps;
			rs=pstmt.executeQuery(sql);
			page = new Page();
			page.setPageSize(sizepage);
			page.setPageCount(rs);
			page.setCurPage(perPage);
			
			r=page.setRs(rs);
			r.previous();
			for (int i = 0; i <page.getPageSize(); i++) {
				if(r.next()){
					order = new Order();
					order.setGet_ticket_key(r.getString(1));
					order.setOder_time(r.getString(2));
					
					order.setTicket_state(Integer.parseInt(r.getString(3)));
					order.setUserid(Integer.parseInt(r.getString(4)));
					order.setDicountid(Integer.parseInt(r.getString(5)));
					
					System.out.println(":  "+r.getString(3)+"  :"+r.getString(4)+" : "+r.getString(5));
			
					System.out.println("keyticket:"+order.getGet_ticket_key()+" TickState: "+order.getTicket_state());
					list.add(order);
					
			}
			map = new HashMap();
			map.put("list", list);
			map.put("pa", page);
			
			
		}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			ResourceClose.close(rs, pstmt);
			ResourceClose.close(r);
			
		}
		
		
		
		
		return map;
	}
	
	

}
