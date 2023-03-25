package com.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class Dbconnection {
	public static Connection createConnection() {
		Connection con=null;
		try {
		 Class.forName("com.mysql.cj.jdbc.Driver");
		 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/advancejava","root","");
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return con;
	}

}
