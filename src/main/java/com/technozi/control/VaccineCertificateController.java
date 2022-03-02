package com.technozi.control;

import com.technozi.entity.PublicUser;

public class VaccineCertificateController {

	public String requestVaccineCertificate(String username) {
		PublicUser publicUser = new PublicUser();
		publicUser.setUserName(username);
		return publicUser.getVaccineCertificate();
	}
}