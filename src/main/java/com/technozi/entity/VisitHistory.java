package com.technozi.entity;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

abstract class VisitHistory {

	protected String userName;
	protected String location;
	protected LocalDateTime date;
	protected int status;

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public void setDate(LocalDateTime date) {
		this.date = date;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	protected String formatDate(LocalDateTime date) {
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		return date.format(formatter);
	}

	protected String convertDateFormat(LocalDateTime date) {
		return date.format(DateTimeFormatter.ofPattern("dd MMMM yyyy"));
	}

	protected String convertTimeFormat(LocalDateTime date) {
		return date.format(DateTimeFormatter.ofPattern("hh:mm a"));
	}
}
