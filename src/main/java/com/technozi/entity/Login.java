package com.technozi.entity;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.technozi.enumerated.AccountStatus;
import com.technozi.enumerated.LoginStatus;
import com.technozi.enumerated.SuspendStatus;
import com.technozi.enumerated.UserType;

public class Login {

	private String userName;
	private String password;
	private String name;
	private int userType;

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

	public int validateLogin() {
		int login_Flag = LoginStatus.ERROR.getInt();
		try {
			Connection con = openConnection();

			String query = "SELECT username, password, account_status, suspend_status FROM technozi_prod.user WHERE username = ? AND password = ?";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, userName);
			pstmt.setString(2, password);
			ResultSet result = pstmt.executeQuery();

			// Correct Credentials
			if (result.next()) {
				if (result.getInt(4) == SuspendStatus.Yes.getInt())
					login_Flag = LoginStatus.SUSPENDED.getInt();
				else if (result.getInt(3) == AccountStatus.Inactive.getInt())
					login_Flag = LoginStatus.INACTIVE.getInt();
				else
					login_Flag = LoginStatus.SUCESS_LOGIN.getInt();
			} else
				login_Flag = LoginStatus.WRONG_CREDENTIALS.getInt();

			con.close();
		} catch (Exception e) {
			e.printStackTrace();
			return login_Flag;
		}
		return login_Flag;
	}

	// For all user
	public String findUserTypeAndName() {
		try {
			Connection con = openConnection();
			Statement stmt = con.createStatement();
			ResultSet result = stmt
					.executeQuery("SELECT user_type, name FROM user WHERE username = '" + userName + "'");
			if (result.next()) {
				setUserType(result.getInt(1));
				setName(result.getString(2));
			} else
				return "";
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}
		return (UserType.values()[this.userType].toString() + "`" + name);
	}

	public Connection openConnection()
			throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException {
		Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
		Connection con = DriverManager.getConnection(
				"jdbc:mysql://aws-technozi.cqgrbgpjvgqt.us-east-1.rds.amazonaws.com/technozi_prod", "admin",
				"technoziPASS");
		return con;
	}
}
