package com.technozi.control;

import com.technozi.entity.PublicUser;

public class VaccineAnnouncementController {

	public boolean getVaccineAnnouncement(String username) {
		PublicUser publicUser = new PublicUser();
		publicUser.setUserName(username);
		return publicUser.getVaccineAnnouncement();
	}
}
