package com.technozi.entity;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.technozi.enumerated.CheckInStatus;

public class BusinessVisitorHistory extends VisitHistory{

	// For Business User
	public List<String> queryVisitorHistory() {
		List<String> visitList = new ArrayList<>();
		try {
			Connection con = openConnection();
			Statement stmt = con.createStatement();
			ResultSet result = stmt.executeQuery(
					"SELECT v.username, (SELECT name FROM technozi_prod.user WHERE username = v.username) as name ,v.date "
							+ "FROM technozi_prod.user AS u " + "JOIN technozi_prod.visit_history AS v "
							+ "ON u.name = v.location " + "WHERE u.username = '" + userName + "'"
							+ "AND CAST(v.date AS DATE) = CAST('" + formatDate(date) + "' AS Date) AND v.status = "
							+ CheckInStatus.CheckIn.getInt());

			while (result.next()) {
				visitList.add(result.getString(1) + "_" + result.getString(2) + "_"
						+ convertDateFormat(result.getTimestamp(3).toLocalDateTime()) + "_"
						+ convertTimeFormat(result.getTimestamp(3).toLocalDateTime()));
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
			return visitList;
		}
		return visitList;
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
