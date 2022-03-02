package com.technozi.control;

import java.util.List;

import com.technozi.entity.PublicUser;

public class VisitHistoryController {

	public List<String> requestVisitHistory(String username) {
		PublicUser publicUser = new PublicUser();
		publicUser.setUserName(username);
		return publicUser.getVisitHistory();
	}
}
