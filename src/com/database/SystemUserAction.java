package com.database;
// create table sysUer 
/*452123199503110217
  create table sysuser(
 		workId int ,
  		name varchar(20),
  		password varchar(20),
 		email varchar(30),
  		phone varchar(11),
  		IDcard varchar(18),
 		primary key(workId)
  );
  
  insert into sysuser (workId,name,email,phone,IDcard) values (1,'misiyu','email','17800000000','123456789987654321');
 select * from sysuser;
 update sysuser set password='123456' where workId=1;
 update sysuser set workId=0 where workId=1;
 */
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class SystemUserAction {
	
	private Connection connection;
	private Statement statement;
	private String table; 
	
	public SystemUserAction(){
		this.table = "sysuser";
		try {
			this.connection = DBConnection.getConnection();
			this.statement = connection.createStatement();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	}
	
	public void findUserByName(){
		
	}
	
	public ResultSet findUserByWorkId(int workId){
		String sql = "select password from "+this.table+" where workId="+workId+";";
		ResultSet  resultSet=null;
		try {
			resultSet=statement.executeQuery(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return resultSet;
	}
}
