package com.technozi.entity;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import com.technozi.enumerated.AckStatus;
import com.technozi.enumerated.UserType;

public class Announcement {

	private int id;
	private String userName;
	private String location;
	private LocalDateTime visitedDate;
	private LocalDateTime creationDate;
	private int ackStatus;
	private String ackUsername;
	private String generator;

	public void setId(int id) {
		this.id = id;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public void setVisitedDate(LocalDateTime visitedDate) {
		this.visitedDate = visitedDate;
	}

	public void setCreationDate(LocalDateTime creationDate) {
		this.creationDate = creationDate;
	}

	public void setAckStatus(int ackStatus) {
		this.ackStatus = ackStatus;
	}

	public void setAckUsername(String ackUsername) {
		this.ackUsername = ackUsername;
	}

	public void setGenerator(String generator) {
		this.generator = generator;
	}

	private String formatDate(LocalDateTime date) {
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		return date.format(formatter);
	}

	private String convertDateFormat(LocalDateTime date) {
		return date.format(DateTimeFormatter.ofPattern("dd MMMM yyyy"));
	}

	private String convertTimeFormat(LocalDateTime date) {
		return date.format(DateTimeFormatter.ofPattern("hh:mm a"));
	}

	public String toString() {
		return String.format("%s, %s, %s, %s, %s, %s, %s, %s", convertDateFormat(creationDate), userName, location,
				convertTimeFormat(visitedDate), convertDateFormat(visitedDate),
				AckStatus.values()[ackStatus].toString(), ackUsername, id);
	}

	// For Public and Business
	public List<String> queryAnnouncement() {
		List<String> annoucementList = new ArrayList<>();
		try {
			Connection con = openConnection();
			Statement stmt = con.createStatement();
			ResultSet result = stmt.executeQuery("SELECT * FROM technozi_prod.announcement " + "WHERE ack_username = '"
					+ userName + "' " + "AND ack_status = 0");

			while (result.next()) {
				setId(result.getInt(1));
				setUserName(result.getString(2));
				setLocation(result.getString(3));
				setVisitedDate(result.getTimestamp(4).toLocalDateTime());
				setCreationDate(result.getTimestamp(5).toLocalDateTime());
				setAckStatus(result.getInt(6));
				setAckUsername(result.getString(7));
				annoucementList.add(this.toString());
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
			return annoucementList;
		}

		return annoucementList;
	}

	// For Public and Business
	public boolean validateAcknowledgement() {
		boolean success = false;
		try {
			Connection con = openConnection();
			Statement stmt = con.createStatement();
			int count = stmt.executeUpdate(
					"UPDATE technozi_prod.announcement SET ack_status = " + ackStatus + " WHERE id = " + id);
			if (count > 0)
				success = true;
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return success;
	}

	// For Health Staff
	public boolean generateAnnouncement() {
		boolean success = false;
		List<String> locationDate = new ArrayList<>();
		List<String> businessID = new ArrayList<>();
		List<String> publicID = new ArrayList<>();

		try {
			Connection con = openConnection();
			Statement stmt = con.createStatement();

			// Check for existing username
			ResultSet rs = stmt.executeQuery("SELECT * FROM technozi_prod.user WHERE username = '" + userName + "' AND user_type = " + UserType.Public.getInt());
			if (rs.next())
				success = true; // Such username is found
			else
				return false; // If not found, return false to end

			// Code below will run if the above is true
			// ..
			// ..
			// Insert infected patient into infected_patient
			int count = stmt.executeUpdate("INSERT INTO technozi_prod.infected_patient (username, date_of_positive) "
					+ "VALUES ('" + userName + "', '" + formatDate(creationDate) + "')"); // creationDate = infectedDate

			// If successfully inserted infected_patient
			if (count > 0) {
				ResultSet result = stmt.executeQuery("SELECT v.location, v.date FROM technozi_prod.visit_history AS v "
						+ "JOIN technozi_prod.infected_patient AS i ON v.username = i.username "
						+ "WHERE i.username = '" + userName + "' "
						+ "AND CAST(v.date AS DATE) >= DATE(NOW()) - INTERVAL 14 DAY "
						+ "GROUP BY v.location, CAST(v.date AS DATE)");

				while (result.next())
					locationDate.add(result.getString(1) + "," + formatDate(result.getTimestamp(2).toLocalDateTime()));

				// Find All Public User -- each execute get all victim from a single location
				for (String locationdate : locationDate) {
					String[] locationDateSplit = locationdate.split(",");
					String location_visited = locationDateSplit[0]; // Patient visited location
					String date_visited = locationDateSplit[1]; // Time of visit
					ResultSet resultPub = stmt
							.executeQuery("SELECT username, date FROM technozi_prod.visit_history WHERE location = '"
									+ location_visited + "' "
									+ "AND CAST(date AS DATE) >= DATE(NOW()) - INTERVAL 14 DAY GROUP BY username");
					while (resultPub.next())
						publicID.add(
								resultPub.getString(1) + "," + formatDate(resultPub.getTimestamp(2).toLocalDateTime())); // Public
																															// username
																															// and
																															// date
																															// of
																															// visit

					// Then add the victims into announcement
					for (String victim : publicID) {
						String[] victimSplit = victim.split(",");
						String victimUser = victimSplit[0]; // username of victim
						stmt.addBatch(
								"INSERT INTO technozi_prod.announcement (username, location, visited_date, creation_date, ack_username, generator) "
										+ "VALUES ('" + userName + "', '" + location_visited + "', '" + date_visited
										+ "', NOW(), '" + victimUser + "', '" + generator + "')");
					}
					publicID.clear();
				}

				// Find All Business User
				for (String locationdate : locationDate) {
					String[] locationDateSplit = locationdate.split(",");
					String business_location = locationDateSplit[0]; // Location of business owner
					ResultSet resultID = stmt.executeQuery(
							"SELECT username, name FROM technozi_prod.user WHERE name = '" + business_location + "'");
					while (resultID.next())
						businessID.add(resultID.getString(1) + "," + resultID.getString(2)); // Business username and
																								// name which is
																								// location

				}

				// Add batch all Business User Announcement
				for (String business : businessID) {
					String[] businessSplit = business.split(",");
					String businessOwner = businessSplit[0];
					String business_location = businessSplit[1];
					System.out.println("Outside working");
					// If the patient's previous location match business user location, add the
					// business user
					for (String locationdate : locationDate) {
						System.out.println("Inside working");
						String[] locationdateSplit = locationdate.split(",");
						String date = locationdateSplit[1];
						if (business_location.equals(locationdateSplit[0]))
							stmt.addBatch(
									"INSERT INTO technozi_prod.announcement (username, location, visited_date, creation_date, ack_username, generator) "
											+ "VALUES ('" + userName + "', '" + business_location + "', '" + date
											+ "', NOW(), '" + businessOwner + "', '" + generator + "')");
					}
				}
			} else
				return false; // Return false if failed to insert

			int countarr[] = stmt.executeBatch();
			if (countarr.length > 0) // Return true if the batch execute works
				success = true;
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return success;
	}

	// For Health Staff
	public List<String> queryGeneratedAnnouncement() {
		List<String> generatedAnnouncementList = new ArrayList<>();
		try {
			Connection con = openConnection();
			Statement stmt = con.createStatement();
			ResultSet result = stmt
					.executeQuery("SELECT a.location, a.creation_date, a.ack_status, a.ack_username , u.name "
							+ "FROM technozi_prod.announcement AS a " + "JOIN technozi_prod.user AS u "
							+ "ON a.ack_username = u.username WHERE a.ack_username != a.username "
							+ "AND a.generator = '" + generator + "'");
			while (result.next()) {
				generatedAnnouncementList.add(result.getString(1) + "," +
				convertDateFormat(result.getTimestamp(2).toLocalDateTime()) + "," +
				convertTimeFormat(result.getTimestamp(2).toLocalDateTime()) + "," +
				AckStatus.values()[result.getInt(3)].toString() + "," +
				result.getString(4) + "," +
				result.getString(5));
			}

			con.close();
		} catch (Exception e) {
			e.printStackTrace();
			return generatedAnnouncementList;
		}
		return generatedAnnouncementList;
	}
	
	// For giving user a heads up that vaccine cert is created
	// For Health Staff
	public boolean queryVaccineCertificateStatus(String patientID) {
		boolean success = false;
		try {
			Connection con = openConnection();
			Statement stmt = con.createStatement();
			ResultSet result = stmt.executeQuery(
					"SELECT * FROM technozi_prod.vaccine_certificate WHERE patient_id = '" + patientID + "'");
			if (result.next())
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
