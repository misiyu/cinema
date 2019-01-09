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

import com.entity.User;
import com.support.Page;
import com.support.ResourceClose;



public class UserAction extends Action{
	static public int sizepage = 5;
	
	public UserAction(){
		super();
		this.table="users";
	}
	
	public ResultSet findUserByEmail(String email){
		String sql = "select password,admin,id from "+this.table+" where email='"+email+"';";
		ResultSet  resultSet=null;
		try {
			resultSet=statement.executeQuery(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return resultSet;
	}
	
	public boolean addUser(User user){
		String sql = "insert into "+this.table+" (id,username,email,password,grade,dollar,admin) values ("
				+"'"+user.getID()
				+"','"+user.getUserName()	
				+"','"+user.getEmail()
				+"','"+user.getPassword()
				+"','"+user.getGrade()
				+"','"+user.getMoney()
				+"',0"
				+");";
		System.out.println(sql);
		try {
			statement.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		return true;
	}
	public Map findAlluser(int perPage) {
		//connection 
		//statement
		//table
		//
		User user = null;		
		LinkedList list = new LinkedList();
		
		ResultSet rs=null;
		ResultSet r=null;
		Statement pstmt=null;
		Page page = null;
		Map map = null;
		try{
			System.out.println("begin in user");
			String sql = new String("select * from users order by id;");
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
					user = new User();
					int id=Integer.parseInt(r.getString(1));
					
					user.setID(id);
					
					user.setUserName(r.getString(2));
					user.setEmail(r.getString(3));
					user.setPassword(r.getString(4));
					
					user.setRegisterTime(r.getString(5));
					user.setGrade(r.getString(6).charAt(0));
					user.setMoney(Double.parseDouble(r.getString(7)));
					user.setSystemAdmin(new Integer(r.getString(8)));
					System.out.println("ID:"+user.getUserName()+" money: "+user.getMoney());
					list.add(user);
					
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
	
	public boolean updateUser(User user){
		//User user = null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		try{
			//conn=ConnectionFactory.getConnection();
			String sql="update users set id=?,username=?,password=?,email=?,"+
				"grade=?,dollar=?,admin=? where id=?"; 
			pstmt=connection.prepareStatement(sql);
			pstmt.setInt(1, user.getID());
			pstmt.setString(2, user.getUserName());
			pstmt.setString(3, user.getPassword());
			pstmt.setString(4, user.getEmail());
			//pstmt.setString(5,user.getRegisterTime() );
			pstmt.setString(5, user.getGrade()+"");
			pstmt.setString(6, user.getMoney()+"");
			pstmt.setInt(7,user.isSystemAdmin() );
			
			pstmt.setInt(8, user.getID());
			
			pstmt.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
			return false;
		}finally{
			ResourceClose.close(rs, pstmt);
		}
		//System.out.println("Update User Success");
		return true;
	}
	
	
	
	public User findUserById(String userID) {
		User user = null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		
		try {
			String sql = "select * from "+ table+" where id=?";
			pstmt = connection.prepareStatement(sql);
			pstmt.setString(1,userID);
			rs = pstmt.executeQuery();
			while(rs.next()){
				user= new User();
				user.setID(Integer.parseInt(rs.getString(1)));
				user.setUserName(rs.getString(2));
				user.setEmail(rs.getString(3));
				user.setPassword(rs.getString(4));
				user.setGrade(rs.getString(6).charAt(0));
				user.setMoney(Double.parseDouble(rs.getString(7)));
				user.setSystemAdmin(new Integer(rs.getString(8)));
				
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
				
		
	//return null;
		
	}

	public boolean delUser(String userId) {
		User user = null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		
		String sql= "delete from "+this.table +" where id=?;";
		try {
			pstmt = connection.prepareStatement(sql);
			pstmt.setString(1,userId);
			System.out.println("Del id is:"+userId);
			pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
				
		return true;
	}

	public LinkedList<User> findAlluserBymultCon(String signid, String signname, Integer type, String dollar, String grade) {
		User user=null;
		LinkedList list = new LinkedList();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
			
		String sql = new String("select * from users where 2=2");
		if(signid!=null&&!signid.equals("")){
			sql+=" and id like '%"+signid+"%'";
		}
		if(signname!=null&&!signname.equals("")){
			sql+=" and username like '%"+signname+"%'";
		}
		
		if(type!=null&&!type.equals("")){
			sql+=" and admin like '%"+type+"%'";
		}
		
		sql+="  order by id;";
		System.out.println("SQL is:"+sql);
		
		try {
			pstmt = connection.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()){
				user= new User();
				user.setID(Integer.parseInt(rs.getString(1)));
				user.setUserName(rs.getString(2));
				user.setPassword(rs.getString(4));
				user.setEmail(rs.getString(3));
				user.setRegisterTime(rs.getString(5));
				user.setGrade(rs.getString(6).charAt(0));
				user.setMoney(Double.parseDouble(rs.getString(7)));
				user.setSystemAdmin(new Integer(rs.getString(8)));
				//System.out.println("ifAdmin"+rs.getString(8));
				//user.setSystemAdmin(Integer.parseInt(rs.getString(8)));
				list.add(user);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
		// order by id
		return list;
		
	}
	
}
