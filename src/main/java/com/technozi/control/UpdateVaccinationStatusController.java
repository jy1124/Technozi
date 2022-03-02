package com.technozi.control;

import java.util.List;
import com.technozi.entity.HealthStaff;

public class UpdateVaccinationStatusController {

	public boolean attemptUpdateVaccinationStatus(String username, int vaccineType, String location) {
		HealthStaff hs = new HealthStaff();
		hs.setUserName(username);
		return hs.updateVaccinationStatus(vaccineType, location);
	}

	public List<String> requestVaccineLocation() {
		HealthStaff hs = new HealthStaff();
		return hs.getVaccineLocation();
	}
}
