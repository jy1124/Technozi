package com.technozi.entity;

import java.time.LocalDateTime;
import java.util.List;

public class HealthStaff extends User {

	public boolean attemptGenerateAnnouncement(String generator) {
		Announcement an = new Announcement();
		an.setUserName(userName); // Set username of infected
		an.setCreationDate(LocalDateTime.now()); // Set current time which is same as setting infected date
		an.setGenerator(generator);
		return an.generateAnnouncement();
	}

	public List<String> getGeneratedAnnouncement() {
		Announcement an = new Announcement();
		an.setGenerator(userName);
		List<String> generatedAnnouncement = an.queryGeneratedAnnouncement();
		return generatedAnnouncement;
	}

	public String getVaccinationStatus() {
		VaccineCertificate vc = new VaccineCertificate();
		vc.setPatientID(userName);
		return vc.queryPatientVaccinationStatus();
	}

	public boolean updateVaccinationStatus(int vaccineType, String location) {
		VaccineCertificate vc = new VaccineCertificate();
		vc.setDate(LocalDateTime.now());
		vc.setPatientID(userName);
		vc.setVaccineType(vaccineType);
		vc.setLocation(location);

		return vc.validateVaccinationStatus();
	}

	public List<String> getVaccineLocation() {
		VaccineLocation vl = new VaccineLocation();
		return vl.queryVaccineLocation();
	}

	@Override
	public String toString() {
		return String.format("%s-%s-%s-%s-%s", name, userName, password, userType, accountStatus);
	}

}
