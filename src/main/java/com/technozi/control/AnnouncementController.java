package com.technozi.control;

import java.util.List;
import com.technozi.entity.Business;
import com.technozi.entity.PublicUser;
import com.technozi.enumerated.UserType;

public class AnnouncementController {

	public List<String> requestAnnouncement(String username, String userType) {
		if (userType == UserType.Public.toString()) {
			PublicUser publicUser = new PublicUser();
			return publicUser.getAnnouncement(username);
		} else {
			Business business = new Business();
			return business.getAnnouncement(username);
		}
	}
}
