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


import java.util.Map;
import com.entity.Discount;
import com.support.Page;
import com.support.ResourceClose;

public class DiscountAction extends Action {
	
	static public int sizepage = 5;
	public DiscountAction() {
		super();
		this.table="discount";
		
	}
	public Map findAlluser(int perPage) {
		
		Discount discount = null;
		LinkedList list = new LinkedList();
		
		ResultSet rs=null;
		ResultSet r=null;
		Statement pstmt=null;
		Page page = null;
		Map map = null;

		try{
			System.out.println("begin");
			String sql = new String("select * from "+this.table+"  order by id;");
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
					discount = new Discount();
					int id=Integer.parseInt(r.getString(1));
					
					discount.setId(id);
					discount.setName(r.getString(2));
					discount.setDiscount_rate(Double.parseDouble(r.getString(3)));
					
					
					System.out.println("ID:"+discount.getId()+" rate: "+discount.getDiscount_rate());
					list.add(discount);
					
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
