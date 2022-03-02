package com.technozi.control;

import com.technozi.entity.HealthOrganisation;

public class SuspendAccountController {

	public boolean requestSuspendAccount(String username) {
		HealthOrganisation ho = new HealthOrganisation();
		ho.setUserName(username);
		return ho.attemptSuspendAccount();
	}
}
