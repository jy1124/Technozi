package com.technozi.entity;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class CheckOut extends VisitHistory{

	// For Public User
	public boolean validateCheckOut() {
		boolean success = false;
		try {
			Connection con = openConnection();
			Statement stmt = con.createStatement();
			int count = stmt.executeUpdate("INSERT INTO visit_history (username, location, date, status) VALUES ('"
					+ userName + "', '" + location + "', '" + formatDate(date) + "', " + status + ")");
			if (count > 0)
				success = true;
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return success;
	}

	private Connection openConnection()
			throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException {
		Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
		Connection con = DriverManager.getConnection(
				"jdbc:mysql://aws-technozi.cqgrbgpjvgqt.us-east-1.rds.amazonaws.com/technozi_prod", "admin",
				"technoziPASS");
		return con;
	}
}
