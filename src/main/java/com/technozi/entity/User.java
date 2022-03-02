package com.technozi.entity;

abstract class User {

	protected String userName;
	protected String password;
	protected String name;
	protected int userType;
	protected int accountStatus;

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

	public abstract String toString();
}
