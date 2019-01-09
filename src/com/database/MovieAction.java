package com.database;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import com.entity.Movie;
import com.support.Page;
import com.support.ResourceClose;


public class MovieAction extends Action{
	static public int sizepage = 15;
	

	public MovieAction() {
		super();
		this.table = "movie";
	}

	public ResultSet getMovieInformation()
	{
		ResultSet resultSet=null;
		String sql="select movie_name,director,protagonist,movie_type,origins,language,pictrue_path,time,introduction from "+this.table+";";
		try {
			resultSet=statement.executeQuery(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return resultSet;
	}

	public Map findAllmovie(int perPage) {
		//Movie movie= null;
		LinkedList list = new LinkedList();
		ResultSet rs=null;
		ResultSet r=null;
		Statement pstmt=null;
		Page page = null;
		Map map = null;
		
		System.out.println("begin");
		String sql = new String("select * from "+ this.table+ " order by id;");
		try {
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
					Movie movtp = new Movie();
					int id=Integer.parseInt(r.getString(1));
					 movtp.setiD(id);
					 movtp.setMovieName(r.getString(2));
					 //r.getString()
					 movtp.setDirector(r.getString(3));
					 movtp.setOrigins(r.getString(4));
					 movtp.setActor_sum(r.getString(5));
					 movtp.setD_type(Integer.parseInt(r.getString(6)));//int
					 movtp.setMovie_type(r.getString(7));
					 movtp.setIntroduction(r.getString(8));
					 movtp.setScore(Double.parseDouble(r.getString(9)));//
					 movtp.setRelease_date(r.getString(10));
					 movtp.setTime(r.getString(11));
					 movtp.setLanguage(r.getString(12));
					 movtp.setPath(r.getString(13));
					 movtp.setMoney(Double.parseDouble(r.getString(14)));
					 list.add(movtp);
				}
			}
			map = new HashMap();
			map.put("list", list);
			map.put("pa", page);
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			ResourceClose.close(rs, pstmt);
			ResourceClose.close(r);
		}
		
		return map;
	}

	public boolean addMovie(Movie movie) {
		String sql = "insert into "+this.table+" (id,movie_name,director,origins,protagonist,D_style,movie_type,"
				+ "introduction,score,release_date,time,language,pictrue_path,box_office) values ("
							
				+"'"+movie.getiD()
				+"','"+movie.getMovieName()
				+"','"+movie.getDirector()
				+"','"+movie.getOrigins()
				+"','"+movie.getActor_sum()
				+"','"+movie.getD_type()
				+"','"+movie.getMovie_type()
				+"','"+movie.getIntroduction()
				+"','"+movie.getScore()
				+"','"+movie.getRelease_date()
				+"','"+movie.getTime()
				+"','"+movie.getLanguage()
				+"','"+movie.getPath()
				+"','"+movie.getMoney()
				//+"','"+movie
				
				+"');";
		System.out.println("ADD information:"+sql);
		try {
			statement.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		return true;
		
		
	}

	public Movie findMovById(String userId) {
		Movie movtp = null;
		PreparedStatement pstmt=null;
		ResultSet r = null;
		try {
			String sql = "select * from "+ table+" where id=?";
			pstmt = connection.prepareStatement(sql);
			pstmt.setString(1,userId);
			r = pstmt.executeQuery();
			while(r.next()){
				movtp= new Movie();
				int id=Integer.parseInt(r.getString(1));
				 movtp.setiD(id);
				 movtp.setMovieName(r.getString(2));
				 //r.getString()
				 movtp.setDirector(r.getString(3));
				 movtp.setOrigins(r.getString(4));
				 movtp.setActor_sum(r.getString(5));
				 movtp.setD_type(Integer.parseInt(r.getString(6)));//int
				 movtp.setMovie_type(r.getString(7));
				 movtp.setIntroduction(r.getString(8));
				 movtp.setScore(Double.parseDouble(r.getString(9)));//
				 movtp.setRelease_date(r.getString(10));
				 movtp.setTime(r.getString(11));
				 movtp.setLanguage(r.getString(12));
				 movtp.setPath(r.getString(13));
				 movtp.setMoney(Double.parseDouble(r.getString(14)));
				
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return movtp;
		
		
		
		
		
		
		
	}

	public boolean updateMovie(Movie movie) {
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		try{
			//conn=ConnectionFactory.getConnection();
			String sql="update movie set id=?, movie_name=?,director=?,origins=?,"+
				" protagonist=?,D_style=?,movie_type=?,introduction=?, score=?,release_date=?, time=?,language=?,box_office=? where id=?"; 
			pstmt=connection.prepareStatement(sql);
			System.out.println("Change value is"+movie.getiD()+":"+movie.getMovieName()+
					":"+movie.getDirector()
					+":"+movie.getOrigins()
					+":"+movie.getActor_sum()
					+":"+movie.getD_type()
					+":"+movie.getMovie_type()
					+":"+movie.getIntroduction()
					+":"+movie.getScore()+""
					+":"+movie.getRelease_date()
					+":"+movie.getTime()
					+":"+movie.getLanguage()
					+":"+movie.getMoney()+""
					
					);
			pstmt.setInt(1, movie.getiD());
			pstmt.setString(2, movie.getMovieName());
			pstmt.setString(3, movie.getDirector());
			pstmt.setString(4, movie.getOrigins());
			pstmt.setString(5,movie.getActor_sum() );
			pstmt.setInt(6, movie.getD_type());
			pstmt.setString(7, movie.getMovie_type());
			pstmt.setString(8, movie.getIntroduction());
			pstmt.setString(9, movie.getScore()+"");
			pstmt.setString(10, movie.getRelease_date());
			pstmt.setString(11, movie.getTime());
			pstmt.setString(12, movie.getLanguage());
			pstmt.setString(13, movie.getMoney()+"");
			pstmt.setString(14, movie.getiD()+"");
			System.out.println("Sql Require is:"+sql+"---");
			//pstmt.setInt(9, user.getID());
			
			pstmt.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
			System.out.println("Update False Movie");
			return false;
			
		}finally{
			ResourceClose.close(rs, pstmt);
		}
		
		System.out.println("Update Success Movie");
		return true;
	}

	public boolean delmovie(String userId) {
		
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

	public List<Movie> findAllmovBymultCon(String area, String moviename, String type, String score1, String score2,
			String contentype) {
		Movie movie=null;
		LinkedList list = new LinkedList();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql = new String("select * from "+this.table+" where 2=2");
		//String sql = new String("select * from "+ "movie_s "+" where 2=2");
		if(area!=null&&!area.equals("")){
			sql+=" and origins like '%"+area+"%'";
		}
		if(moviename!=null&&!moviename.equals("")){
			sql+=" and movie_name like '%"+moviename+"%'";
		}
		if(type!=null&&!type.equals("")){
			if(Integer.parseInt(type)!=0)
				sql+=" and D_style like '%"+type+"%'";
		}
		if(score1!=null&&score2!=null&&!score1.equals("")&&!score2.equals("")){
			sql+=" and score between "+score1+" and  "+score2;
		}
		else{
			if(score1!=null&&!score1.equals("")){
				sql+=" and score > "+score1;
			}
			else if(score2!=null&&!score2.equals("")){
				sql+=" and score < "+score2;
			}
		}
		if(contentype!=null&&!contentype.equals("")){
			sql+=" and  movie_type like '%"+contentype+"%'";
		}
		sql+="  order by id;";
		
		System.out.println("SQL is:"+sql);
		
		try {
			pstmt = connection.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()){
				movie=new Movie();
				movie.setiD(Integer.parseInt(rs.getString(1)));
				
				movie.setMovieName(rs.getString(2));
				movie.setDirector(rs.getString(3));
				movie.setOrigins(rs.getString(4));
				
				movie.setActor_sum(rs.getString(5));
				
				movie.setD_type(Integer.parseInt(rs.getString(6)));
				
				movie.setMovie_type(rs.getString(7));
				
				movie.setIntroduction(rs.getString(8));
				if(rs.getString(9)!=null)
					movie.setScore(Double.parseDouble(rs.getString(9)));
				
				movie.setRelease_date(rs.getString(10));
				
				movie.setTime(rs.getString(11));
				
				movie.setLanguage(rs.getString(12));
				//13 is path 
				if(rs.getString(14)!=null)
					movie.setMoney(Double.parseDouble(rs.getString(14)));
				
				list.add(movie);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
		
		return list;
	}
	
}
