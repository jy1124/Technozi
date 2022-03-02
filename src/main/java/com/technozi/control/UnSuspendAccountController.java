package com.technozi.control;

import com.technozi.entity.HealthOrganisation;

public class UnSuspendAccountController {

	public boolean requestUnSuspend(String username) {
		HealthOrganisation ho = new HealthOrganisation();
		ho.setUserName(username);
		return ho.attemptUnSuspendAccount();
	}
}
