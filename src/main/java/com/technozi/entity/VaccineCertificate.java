package com.technozi.entity;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import com.technozi.enumerated.VaccineType;

public class VaccineCertificate {

	private int batchNo;
	private int vaccineType;
	private String location;
	private String patientID;
	private LocalDateTime date;

	public void setBatchNo(int batchNo) {
		this.batchNo = batchNo;
	}

	public void setVaccineType(int vaccineType) {
		this.vaccineType = vaccineType;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public void setDate(LocalDateTime date) {
		this.date = date;
	}

	public void setPatientID(String patientID) {
		this.patientID = patientID;
	}

	private String formatDate(LocalDateTime date) {
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		return date.format(formatter);
	}

	private String convertDateFormat(LocalDateTime date) {
		return date.format(DateTimeFormatter.ofPattern("dd MMMM yyyy"));
	}

	public String toString() {
		return String.format("%s, %s, %s, %s, %s", batchNo, VaccineType.values()[vaccineType].toString(), location,
				patientID, convertDateFormat(date));
	}

	// For Public User
	public String queryVaccineCertificate() {
		try {
			Connection con = openConnection();
			Statement stmt = con.createStatement();
			ResultSet result = stmt
					.executeQuery("SELECT * FROM vaccine_certificate WHERE patient_id = '" + patientID + "'");
			if (result.next()) {
				setBatchNo(result.getInt(2));
				setVaccineType(result.getInt(3));
				setLocation(result.getString(4));
				setPatientID(result.getString(5));
				setDate(result.getTimestamp(6).toLocalDateTime());
			} else
				return "";

			con.close();
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}
		return this.toString();
	}

	// For Health Staff
	public String queryPatientVaccinationStatus() {
		String data = "";
		boolean userExist = false;
		try {
			Connection con = openConnection();
			Statement stmt = con.createStatement();
			ResultSet userResult = stmt.executeQuery(
					"SELECT * FROM technozi_prod.user WHERE username = '" + patientID + "' AND user_type = 0");
			while (userResult.next())
				userExist = true;

			if (userExist) {
				ResultSet result = stmt
						.executeQuery("SELECT v.patient_id, u.name FROM technozi_prod.vaccine_certificate AS v "
								+ "JOIN technozi_prod.user AS u ON v.patient_id = u.username "
								+ "WHERE v.patient_id = '" + patientID + "'");

				if (result.next()) { // Result found = vaccinated
					data = result.getString(1) + "-" + result.getString(2) + "-" + "Yes";
				} else { // No result found means not vaccinated
					ResultSet result2 = stmt
							.executeQuery("SELECT name FROM technozi_prod.user WHERE username = '" + patientID + "'");
					while (result2.next()) {
						data = patientID + "-" + result2.getString(1) + "-" + "No";
					}
				}
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}
		return userExist == true ? data : "";
	}

	// For Health Staff
	public boolean validateVaccinationStatus() {
		boolean success = false;
		try {
			Connection con = openConnection();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT MAX(batch_no) FROM technozi_prod.vaccine_certificate");
			while (rs.next())
				setBatchNo(rs.getInt(1) + 1);

			int count = stmt.executeUpdate(
					"INSERT INTO technozi_prod.vaccine_certificate (batch_no, vaccine_type, location, patient_id, date) "
							+ "VALUES (" + batchNo + ", " + vaccineType + ", '" + location + "', '" + patientID + "', '"
							+ formatDate(date) + "')");
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
