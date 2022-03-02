package com.technozi.control;

import com.technozi.entity.HealthOrganisation;

public class AddAccountsController {

	public boolean requestAddAccount(String name, String username, String password, int userType) {
		HealthOrganisation ho = new HealthOrganisation();
		ho.setName(name);
		ho.setUserName(username);
		ho.setPassword(password);
		ho.setUserType(userType);
		return ho.attemptAddAccount();
	}
}
