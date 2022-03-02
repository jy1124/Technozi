package com.technozi.control;

import com.technozi.entity.HealthStaff;

public class GenerateAnnouncementController {

	public boolean requestGenerateAnnouncement(String username, String generator) {
		HealthStaff hs = new HealthStaff();
		hs.setUserName(username);
		return hs.attemptGenerateAnnouncement(generator);
	}
}
