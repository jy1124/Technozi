package com.technozi.entity;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.technozi.enumerated.SuspendStatus;

public class AccountsManagement {

	private String userName;
	private String password;
	private String name;
	private int userType;
	private int accountStatus;

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setUserType(int userType) {
		this.userType = userType;
	}

	public void setAccountStatus(int accountStatus) {
		this.accountStatus = accountStatus;
	}

	public String toString() {
		return String.format("%s-%s-%s-%s-%s", name, userName, password, userType, accountStatus);
	}
	
	// For Health Organisation
	public boolean validateAddAccount() {
		boolean success = false;
		try {
			Connection con = openConnection();
			Statement stmt = con.createStatement();
			ResultSet result = stmt
					.executeQuery("SELECT * FROM technozi_prod.user WHERE username = '" + userName + "'");
			if (result.next())
				return false;
			else {
				int count = stmt
						.executeUpdate("INSERT INTO technozi_prod.user (username, password, name, user_type) VALUES ('"
								+ userName + "', '" + password + "', '" + name + "', '" + userType + "')");
				// Check if insert success
				if (count > 0)
					success = true;
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return success;
	}

	// For Health Organisation
	public boolean validateUpdateAccount() {
		boolean success = false;
		try {
			Connection con = openConnection();
			Statement stmt = con.createStatement();
			int count = stmt.executeUpdate("UPDATE technozi_prod.user SET password = '" + password + "', " + "name = '"
					+ name + "', " + "user_Type = " + userType + ", " + "account_status = " + accountStatus + " "
					+ "WHERE username = '" + userName + "' ");
			// Check if update success
			if (count > 0)
				success = true;
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return success;
	}

	// For Health Organisation
	public boolean validateSuspendAccount() {
		boolean success = false;
		try {
			Connection con = openConnection();
			Statement stmt = con.createStatement();
			// Execute update
			int count = stmt.executeUpdate("UPDATE technozi_prod.user SET suspend_status = "
					+ SuspendStatus.Yes.getInt() + " WHERE username = '" + userName + "'");
			// Check if update success
			if (count > 0)
				success = true;
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return success;
	}

	// For Health Organisation
	public boolean validateUnSuspendAccount() {
		boolean success = false;
		try {
			Connection con = openConnection();
			Statement stmt = con.createStatement();
			int count = stmt.executeUpdate("UPDATE technozi_prod.user SET suspend_status = " + SuspendStatus.No.getInt()
					+ " WHERE username = '" + userName + "'");
			// Check if update success
			if (count > 0)
				success = true;
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return success;
	}

	// For Health Organisation
	public String queryUserDetails() {
		try {
			Connection con = openConnection();
			Statement stmt = con.createStatement();
			ResultSet result = stmt.executeQuery(
					"SELECT username, password, name, user_type, account_status FROM technozi_prod.user WHERE username = '"
							+ userName + "'");
			if (result.next()) {
				setUserName(result.getString(1));
				setPassword(result.getString(2));
				setName(result.getString(3));
				setUserType(result.getInt(4));
				setAccountStatus(result.getInt(5));
			} else
				return "";
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}
		return this.toString();
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
