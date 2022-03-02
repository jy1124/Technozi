package com.technozi.entity;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class VaccineLocation extends Location {

	@Override
	public String toString() {
		return String.format("%s", location);
	}

	public List<String> queryVaccineLocation() {
		List<String> locationList = new ArrayList<>();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
			Connection con = openConnection();
			Statement stmt = con.createStatement();
			ResultSet result = stmt.executeQuery("SELECT location FROM vaccine_location");
			while (result.next()) {
				setLocation(result.getString(1));
				locationList.add(this.toString());
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
			return locationList;
		}
		return locationList;
	}

	private Connection openConnection()
			throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException {
		Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
		Connection con = DriverManager.getConnection(
				"jdbc:mysql://aws-technozi.cqgrbgpjvgqt.us-east-1.rds.amazonaws.com/technozi_prod", "admin",
				"technoziPASS");
		return con;
		// jdbc:mysql://127.0.0.1:3306/?user=root
	}

}