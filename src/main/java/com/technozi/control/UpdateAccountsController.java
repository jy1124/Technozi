package com.technozi.control;

import com.technozi.entity.HealthOrganisation;
public class UpdateAccountsController {

	public String requestUserDetails(String username) {
		HealthOrganisation ho = new HealthOrganisation();
		ho.setUserName(username);
		
		return ho.getUserDetails();
	}
	
	public boolean requestUpdateAccount(String name, String username, String password, int userType, int accountStatus) {
		HealthOrganisation ho = new HealthOrganisation();
		ho.setName(name);
		ho.setUserName(username);
		ho.setPassword(password);
		ho.setUserType(userType);
		ho.setAccountStatus(accountStatus);
		
		return ho.attemptUpdateAccount();
	}
}
