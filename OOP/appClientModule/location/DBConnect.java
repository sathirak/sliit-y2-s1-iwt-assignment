package com.location;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
	
	private static String url = "jdbc:mysql://sql12.freesqldatabase.com:3306/?user=sql12774435";
	private static String userName = "sql12774435";
	private static String password = "eApaLQH2Sd";
	private static Connection con;

	public static Connection getConnection() {

		try {

			Class.forName("com.mysql.jdbc.Driver");

			con = DriverManager.getConnection(url, userName, password);

		} catch (Exception e) {
			System.out.println("Database connection is not success!!!");
		}

		return con;
	}
}
