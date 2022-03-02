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

public class Report {

	private String userName;
	private LocalDateTime dateOfPositive;

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public void setDateOfPositive(LocalDateTime dateOfPositive) {
		this.dateOfPositive = dateOfPositive;
	}

	private String convertDateFormat(LocalDateTime date) {
		return date.format(DateTimeFormatter.ofPattern("dd MMMM yyyy"));
	}

	private String toStringForDailyInFileFormat() {
		return String.format("%-10s %15s", userName, convertDateFormat(dateOfPositive));
	}

	private String toStringForDaily() {
		return String.format("%s,%s", userName, convertDateFormat(dateOfPositive));
	}

	private String toStringForClusterInFileFormat(String location, LocalDateTime date) {
		return String.format("%-30s %20s", location, convertDateFormat(date));
	}

	private String toStringForCluster(String location, LocalDateTime date) {
		return String.format("%s,%s", location, convertDateFormat(date));
	}

	private String convertToTotalReport(List<String> generateReportList) {
		String header = "---------------- Total Covid19 Cases ----------------\n";
		String header2 = "NRIC           Date Of Positive              \n";

		String records = "";
		for (String record : generateReportList) {
			records += record + "\n";
		}
		String dash = "-----------------------------------------------------\n";
		String header3 = "Total cases: " + generateReportList.size();
		return header + header2 + records + dash + header3;
	}

	private String convertToClusterReport(List<String> generateClusterList) {
		String header = "-------------------------- Cluster Covid19 Cases ------------------------\n";
		String header2 = "Location                                Date Of Cluster              \n";
		String clusterRecords = "";

		for (String record : generateClusterList) {
			clusterRecords += record + "\n";
		}

		String dash = "--------------------------------------------------------------------------\n";
		String header3 = "Total Cases: " + generateClusterList.size();
		return header + header2 + clusterRecords + dash + header3;
	}

	private String convertToDailyReport(List<String> generateReportList) {
		String header = "---------------- Total Covid19 Cases ----------------\n";
		String header2 = "NRIC           Date Of Positive              \n";

		String records = "";
		for (String record : generateReportList) {
			records += record + "\n";
		}

		String dash = "-----------------------------------------------------\n";
		String header3 = "Total cases: " + generateReportList.size();
		return header + header2 + records + dash + header3;
	}

	// For Health Organisation
	private String convertToStatisticReport(int infectedPersonnel, int infectedPersonnelWithVaccine,
			List<String> uniqueDateWithCaseList, List<String> locationCountList) {

		String header = "                                                       \n"
				+ "                Covid Statistics Report                \n"
				+ "                                                       \n";

		String dateWithCaseRecord = "";
		String highestCase = "";
		int highest = 0;
		String highestLocation = "";

		for (String record : uniqueDateWithCaseList) {
			dateWithCaseRecord += record + "\n";
			String[] splitted = record.split(" : ");
			if (Integer.parseInt(splitted[1]) > highest) {
				highestCase = record;
				highest = Integer.parseInt(splitted[1]);
			}
		}

		highest = 0;
		for (String record : locationCountList) {
			String[] splitted = record.split(" : ");
			if (Integer.parseInt(splitted[1]) > highest) {
				highestLocation = record + "\n";
				highest = Integer.parseInt(splitted[1]);
			} else if (Integer.parseInt(splitted[1]) == highest) {
				highestLocation += record + "\n";
			}
		}
		String shortDash = "-----------------------------------------------------\n";
		String header0 = "Total Infected Personnel: " + infectedPersonnel + "\n" + shortDash;
		String header1 = "Total Location(Unique): " + locationCountList.size() + "\n" + shortDash;
		String header2 = "Highest Cluster's Location: \n" + highestLocation + shortDash;
		String header3 = "Total Cluster Cases(Per Day): \n" + dateWithCaseRecord + shortDash;
		String header4 = "Highest Amount Of Clusters: \n" + highestCase + "\n" + shortDash;
		String header5 = "Total Cases Of Infected despite vaccinated: " + infectedPersonnelWithVaccine + "\n"
				+ shortDash;

		return header + header0 + header1 + header2 + header3 + header4 + header5;
	}

	// Generate All Cases For Health Organisation
	public List<String> queryAllCaseViewReport() {
		List<String> generateReportList = new ArrayList<>();
		try {
			Connection con = openConnection();
			Statement stmt = con.createStatement();
			ResultSet result = stmt
					.executeQuery("SELECT username, date_of_positive FROM technozi_prod.infected_patient "
							+ "GROUP by username, CAST(date_of_positive AS DATE)");
			while (result.next()) {
				setUserName(result.getString(1));
				setDateOfPositive(result.getTimestamp(2).toLocalDateTime());
				generateReportList.add(this.toStringForDaily());
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
			return generateReportList;
		}
		return generateReportList;
	}

	// Generate all cases in File format For Health Organisation
	public String queryFileFormatAllCaseReport() {
		List<String> generateReportList = new ArrayList<>();
		try {
			Connection con = openConnection();
			Statement stmt = con.createStatement();
			ResultSet result = stmt
					.executeQuery("SELECT username, date_of_positive FROM technozi_prod.infected_patient "
							+ "GROUP by username, CAST(date_of_positive AS DATE)");
			while (result.next()) {
				setUserName(result.getString(1));
				setDateOfPositive(result.getTimestamp(2).toLocalDateTime());
				generateReportList.add(this.toStringForDailyInFileFormat());
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}
		return convertToTotalReport(generateReportList);
	}

	// Generate All Clusters For Health Organisation
	public List<String> queryClusterViewReport() {
		List<String> generateReportList = new ArrayList<>();
		try {
			Connection con = openConnection();
			Statement stmt = con.createStatement();
			ResultSet result = stmt.executeQuery(
					"SELECT v.location, CAST(v.date AS Date) AS visitDate FROM technozi_prod.visit_history AS v "
							+ "JOIN technozi_prod.infected_patient as i " + "ON v.username = i.username "
							+ "AND i.username IN (SELECT username FROM technozi_prod.infected_patient) "
							+ "GROUP BY  v.location, CAST(v.date AS Date)");
			while (result.next()) // Includes location and date of cluster
				generateReportList
						.add(this.toStringForCluster(result.getString(1), result.getTimestamp(2).toLocalDateTime()));

			con.close();
		} catch (Exception e) {
			e.printStackTrace();
			return generateReportList;
		}
		return generateReportList;
	}

	// Generate cluster in File format For Health Organisation
	public String queryFileFormatClusterReport() {
		List<String> generateReportList = new ArrayList<>();
		try {
			Connection con = openConnection();
			Statement stmt = con.createStatement();
			ResultSet result = stmt.executeQuery(
					"SELECT v.location, CAST(v.date AS Date) AS visitDate FROM technozi_prod.visit_history AS v "
							+ "JOIN technozi_prod.infected_patient as i " + "ON v.username = i.username "
							+ "AND i.username IN (SELECT username FROM technozi_prod.infected_patient) "
							+ "GROUP BY  v.location, CAST(v.date AS Date)");
			while (result.next()) // Includes location and date of cluster
				generateReportList.add(this.toStringForClusterInFileFormat(result.getString(1),
						result.getTimestamp(2).toLocalDateTime()));
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}
		return convertToClusterReport(generateReportList);
	}

	// For Health Organisation
	public List<String> queryDailyCaseByDateViewReport() {
		List<String> generateReportList = new ArrayList<>();
		try {
			Connection con = openConnection();
			Statement stmt = con.createStatement();
			ResultSet result = stmt
					.executeQuery("SELECT username, date_of_positive FROM technozi_prod.infected_patient WHERE "
							+ "CAST(date_of_positive AS Date) = CAST('" + dateOfPositive + "' AS Date)");
			while (result.next()) {
				setUserName(result.getString(1));
				generateReportList.add(this.toStringForDaily());
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
			return generateReportList;
		}
		return generateReportList;
	}

	// For Health Organisation
	public String queryFileFormatCaseByDateReport() {
		List<String> generateReportList = new ArrayList<>();
		try {
			Connection con = openConnection();
			Statement stmt = con.createStatement();
			ResultSet result = stmt
					.executeQuery("SELECT username, date_of_positive FROM technozi_prod.infected_patient WHERE "
							+ "CAST(date_of_positive AS Date) = CAST('" + dateOfPositive + "' AS Date)");
			while (result.next()) {
				setUserName(result.getString(1));
				generateReportList.add(this.toStringForDailyInFileFormat());
			}
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}
		return convertToDailyReport(generateReportList);
	}

	// For Health Organisation
	public String queryStatisticViewReport() {
		return queryFileFormatStatisticReport();
	}

	// For Health Organisation
	public String queryFileFormatStatisticReport() {
		List<String> uniqueDateWithCaseList = new ArrayList<>();
		List<String> locationCountList = new ArrayList<>();
		int infectedPersonnel = 0;
		int infectedPersonnelWithVaccine = 0;
		try {
			Connection con = openConnection();
			Statement stmt = con.createStatement();
			ResultSet totalClusterDaysQuery = stmt.executeQuery("SELECT Z.visitDate, COUNT(*) AS TOTAL FROM "
					+ "(SELECT v.location , CAST(v.date AS Date) AS visitDate FROM technozi_prod.visit_history AS v "
					+ "JOIN technozi_prod.infected_patient as i ON v.username = i.username "
					+ "AND i.username IN (SELECT username FROM technozi_prod.infected_patient) "
					+ "GROUP BY v.location, CAST(v.date AS Date)) AS Z " + "GROUP BY Z.visitDate");
			while (totalClusterDaysQuery.next())
				uniqueDateWithCaseList.add(convertDateFormat(totalClusterDaysQuery.getTimestamp(1).toLocalDateTime())
						+ " : " + totalClusterDaysQuery.getInt(2));

			ResultSet numberOfLocationQuery = stmt.executeQuery("SELECT Z.location, COUNT(Z.location) AS Total FROM "
					+ "(SELECT v.location AS location, CAST(v.date AS Date) AS visitDate FROM technozi_prod.visit_history AS v "
					+ "JOIN technozi_prod.infected_patient as i ON v.username = i.username "
					+ "AND i.username IN (SELECT username FROM technozi_prod.infected_patient) "
					+ "GROUP BY v.location, CAST(v.date AS Date)) AS Z " + "GROUP BY Z.location");
			while (numberOfLocationQuery.next())
				locationCountList.add(numberOfLocationQuery.getString(1) + " : " + numberOfLocationQuery.getInt(2));

			ResultSet infectedQuery = stmt.executeQuery("SELECT COUNT(Z.username) AS TOTAL "
					+ "FROM (SELECT username  FROM technozi_prod.infected_patient " + "GROUP BY username) AS Z");
			while (infectedQuery.next())
				infectedPersonnel = infectedQuery.getInt(1);

			ResultSet infectedEvenWithVaccineQuery = stmt
					.executeQuery("SELECT COUNT(i.username) AS Total FROM technozi_prod.infected_patient AS i "
							+ "JOIN technozi_prod.vaccine_certificate AS v " + "ON i.username = v.patient_id "
							+ "WHERE CAST(v.date AS Date) < CAST(i.date_of_positive AS Date)");
			while (infectedEvenWithVaccineQuery.next())
				infectedPersonnelWithVaccine = infectedEvenWithVaccineQuery.getInt(1);
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}
		return convertToStatisticReport(infectedPersonnel, infectedPersonnelWithVaccine, uniqueDateWithCaseList,
				locationCountList);
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
