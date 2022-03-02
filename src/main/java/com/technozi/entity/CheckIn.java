package com.technozi.entity;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import com.technozi.enumerated.CheckInStatus;

public class CheckIn extends VisitHistory {

	public String toString() {
		return String.format("%s, %s, %s, %s", userName, location, convertDateFormat(date), convertTimeFormat(date),
				CheckInStatus.values()[status].toString());
	}

	// For Public User
	public boolean validateCheckIn() {
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

	// For Public User
	public String queryLatestCheckInResult() {
		try {
			Connection con = openConnection();
			Statement stmt = con.createStatement();
			ResultSet result = stmt.executeQuery(
					"SELECT * FROM visit_history WHERE username = '" + userName + "' ORDER BY id DESC LIMIT 1");
			if (result.next()) {
				setUserName(result.getString(2));
				setLocation(result.getString(3));
				setDate(result.getTimestamp(4).toLocalDateTime());
				setStatus(result.getInt(5));
			} else
				return "";
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}
		return this.toString();
	}

	// For Public User
	public List<String> queryCheckedInLocation() {
		List<String> locationList = new ArrayList<>();
		try {
			Connection con = openConnection();
			Statement stmt = con.createStatement();
			ResultSet result = stmt.executeQuery("SELECT v.username, v.location, v.date, v.status "
					+ "FROM technozi_prod.visit_history v " + "INNER JOIN (SELECT location, max(date) as MaxDate "
					+ "FROM technozi_prod.visit_history " + "WHERE username = '" + userName + "' "
					+ "GROUP BY location) v1 " + "ON v.location = v1.location and v.date = v1.MaxDate "
					+ "WHERE v.username = '" + userName + "'" + "AND v.status = " + status);

			while (result.next()) {
				setUserName(result.getString(1));
				setLocation(result.getString(2));
				setDate(result.getTimestamp(3).toLocalDateTime());
				setStatus(result.getInt(4));
				locationList.add(this.toString());
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
			return locationList;
		}
		return locationList;
	}

	// For Public User
	public List<String> queryCheckedInHistory() {
		List<String> visitList = new ArrayList<>();
		try {
			Connection con = openConnection();
			Statement stmt = con.createStatement();
			ResultSet result = stmt.executeQuery("SELECT * FROM visit_history WHERE username = '" + userName + "' "
					+ "AND status = " + CheckInStatus.CheckIn.getInt());
			while (result.next()) {
				setUserName(result.getString(2));
				setLocation(result.getString(3));
				setDate(result.getTimestamp(4).toLocalDateTime());
				setStatus(result.getInt(5));
				visitList.add(this.toString());
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
