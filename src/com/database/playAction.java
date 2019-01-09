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

import com.entity.Play;
import com.support.Page;
import com.support.ResourceClose;

public class playAction extends Action {
	
	static public int sizepage = 5;
	
	public playAction() {
		super();
		this.table="plays";
	}

	public Map findAllplays(int perPage) {
		Play play = null;
		LinkedList list = new LinkedList();
		
		ResultSet rs=null;
		ResultSet r=null;
		Statement pstmt=null;
		Page page = null;
		Map map = null;
		
		try{
			System.out.println("begin in playAction");
			String sql = new String("select * from "+this.table+" order by start_time desc");
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
					play = new Play();
					play.setMovie_id(Integer.parseInt(r.getString(1)));
					play.setMhall_id(Integer.parseInt(r.getString(2)));
					play.setStart_time(r.getString(3));
							
					System.out.println("Movie_id:"+play.getMovie_id()+" STime: "+play.getStart_time());
					list.add(play);
					
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
