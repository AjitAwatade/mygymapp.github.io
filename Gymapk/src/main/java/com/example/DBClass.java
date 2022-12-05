package com.example;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBClass {
	public Connection cn;
	//It is better to throw back exception to JSP page. JSP automatically handles it.
	public void connect() throws SQLException{		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/DB1","root","city");
	}
	public void close() throws SQLException {
		cn.close();
	}
	//db.execute("Insert into stud values(?,?,?)",roll,name,address)");
	public void execute(String sql,Object ...args) throws SQLException {
		connect();
		PreparedStatement ps=cn.prepareStatement(sql);
		int i=1;
		for(Object arg : args) {
			ps.setObject(i, arg);
			i++;
		}
		ps.executeUpdate();		
		close();
	}
	//ResultSet rs=db.getData("select * from stud");
	public ResultSet getData(String sql,Object ...args) throws SQLException {
		connect();
		PreparedStatement ps=cn.prepareStatement(sql);
		int i=1;
		for(Object arg : args) {
			ps.setObject(i, arg);
			i++;
		}
		ResultSet rs=ps.executeQuery();		
		//close();
		return rs;
	}
	

}
