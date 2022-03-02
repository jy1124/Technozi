package com.technozi.entity;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

public class Business extends User {

	public List<String> getAnnouncement(String username) {
		Announcement an = new Announcement();
		an.setUserName(username);
		List<String> anouncementList = an.queryAnnouncement();
		return anouncementList;
	}

	public boolean attemptAcknowledgement(String recordID) {
		Announcement ann = new Announcement();
		ann.setId(Integer.parseInt(recordID));
		ann.setAckStatus(1);
		return ann.validateAcknowledgement();
	}

	public List<String> getVisitorHistory(String username, String date) {
		BusinessVisitorHistory bvh = new BusinessVisitorHistory();
		bvh.setUserName(username);
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		LocalDate localDate = LocalDate.parse(date, formatter);
		bvh.setDate(LocalDateTime.of(localDate, LocalDateTime.now().toLocalTime()));
		return bvh.queryVisitorHistory();
	}

	@Override
	public String toString() {
		return String.format("%s-%s-%s-%s-%s", name, userName, password, userType, accountStatus);
	}

}