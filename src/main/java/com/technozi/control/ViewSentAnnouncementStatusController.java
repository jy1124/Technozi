package com.technozi.control;

import java.util.List;
import com.technozi.entity.HealthStaff;

public class ViewSentAnnouncementStatusController {

	public List<String> requestGeneratedAnnouncement(String generator) {
		HealthStaff healthStaff = new HealthStaff();
		healthStaff.setUserName(generator);
		return healthStaff.getGeneratedAnnouncement();
	}
}
