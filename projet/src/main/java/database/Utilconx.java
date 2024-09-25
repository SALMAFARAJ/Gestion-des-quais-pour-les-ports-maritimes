package database;

import java.sql.Connection;
import java.sql.DriverManager;

public class Utilconx {

	public static Connection Seconnecter() {
		try {
		Class.forName("com.mysql.cj.jdbc.Driver") ;
		return DriverManager.getConnection("jdbc:mysql://localhost:3306/marsa","root","");
	} catch (Exception e) {
		// TODO: handle exception
	}return null;

	}}		
	
