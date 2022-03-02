package com.technozi.control;

import java.util.List;

import com.technozi.entity.PublicUser;

public class CheckOutController {

	public List<String> requestCheckInLocation(String username) {
		PublicUser publicUser = new PublicUser();
		publicUser.setUserName(username);
		return publicUser.getCheckInLocation();
	}

	public boolean requestCheckOut(String username, String location) {
		PublicUser publicUser = new PublicUser();
		publicUser.setUserName(username);
		return publicUser.attemptCheckOut(location);
	}
}
