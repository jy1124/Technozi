package com.technozi.control;

import com.technozi.entity.HealthStaff;

public class ViewVaccinationStatusController {

	public String requestVaccinationStatus(String username) {
		HealthStaff hs = new HealthStaff();
		hs.setUserName(username);
		return hs.getVaccinationStatus();
	}
}
