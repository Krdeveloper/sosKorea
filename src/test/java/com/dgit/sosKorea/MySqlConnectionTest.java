package com.dgit.sosKorea;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

public class MySqlConnectionTest {
	private static final String DRIVER = "com.mysql.jdbc.Driver";
	private static final String URL = "jdbc:mysql://127.0.0.1:3306/sosKorea";
	private static final String ID = "root";
	private static final String PW = "rootroot";
	
	/*@Test
	public void testConnection() throws ClassNotFoundException{
		Class.forName(DRIVER);
		Connection conn = null;
		
		try{
			conn = DriverManager.getConnection(URL, ID, PW);
			System.out.println(conn);
		}catch(Exception e){
			e.printStackTrace();
		}
	}*/
}
