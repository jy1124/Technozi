package com.technozi.control;

import java.util.List;
import com.technozi.entity.PublicUser;

public class CheckInController {

	public boolean requestCheckIn(String username, String location) {
		PublicUser publicUser = new PublicUser();
		publicUser.setUserName(username);
		return publicUser.attemptCheckIn(location);
	}

	public List<String> requestSearchedLocation(String location) {
		PublicUser publicUser = new PublicUser();
		return publicUser.getSearchedLocation(location);
	}

	public String requestLatestCheckInResult(String username) {
		PublicUser publicUser = new PublicUser();
		publicUser.setUserName(username);
		return publicUser.getLatestCheckInResult();
	}
}
