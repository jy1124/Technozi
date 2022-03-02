package com.technozi.control;

import com.technozi.entity.Login;

public class LoginController {

	public int attemptLogin(String username, String password) {
		Login login = new Login();
		login.setUserName(username);
		login.setPassword(password);
		return login.validateLogin();
	}

	// Settled
	public String checkUserTypeAndName(String username) {
		Login login = new Login();
		login.setUserName(username);
		return login.findUserTypeAndName();
	}
}
