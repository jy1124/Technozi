package com.technozi.entity;

import java.time.LocalDateTime;
import java.util.List;

import com.technozi.enumerated.CheckInStatus;

public class PublicUser extends User {

	public boolean getVaccineAnnouncement() {
		Announcement an = new Announcement();
		return an.queryVaccineCertificateStatus(userName);
	}

	public List<String> getAnnouncement(String username) {
		Announcement an = new Announcement();
		an.setUserName(username);
		List<String> announcementList = an.queryAnnouncement();
		return announcementList;
	}

	public boolean attemptAcknowledgement(String recordID) {
		Announcement an = new Announcement();
		an.setId(Integer.parseInt(recordID));
		an.setAckStatus(1);
		return an.validateAcknowledgement();
	}

	public String getVaccineCertificate() {
		VaccineCertificate vc = new VaccineCertificate();
		vc.setPatientID(userName);
		return vc.queryVaccineCertificate();
	}

	public List<String> getVisitHistory() {
		CheckIn ci = new CheckIn();
		ci.setUserName(userName);
		return ci.queryCheckedInHistory();
	}

	public boolean attemptCheckIn(String location) {
		CheckIn checkIn = new CheckIn();
		checkIn.setUserName(userName);
		checkIn.setLocation(location);
		LocalDateTime localDate = LocalDateTime.now();
		checkIn.setDate(localDate);
		checkIn.setStatus(CheckInStatus.CheckIn.getInt());
		return checkIn.validateCheckIn();
	}

	public List<String> getSearchedLocation(String location) {
		BusinessLocation lc = new BusinessLocation();
		lc.setLocation(location);
		return lc.querySearchedLocation();
	}

	public String getLatestCheckInResult() {
		CheckIn ci = new CheckIn();
		ci.setUserName(userName);
		return ci.queryLatestCheckInResult();
	}

	public List<String> getCheckInLocation() {
		CheckIn ci = new CheckIn();
		ci.setUserName(userName);
		ci.setStatus(CheckInStatus.CheckIn.getInt());
		return ci.queryCheckedInLocation();
	}

	public boolean attemptCheckOut(String location) {
		CheckOut checkOut = new CheckOut();
		checkOut.setUserName(userName);
		checkOut.setLocation(location);
		LocalDateTime localDate = LocalDateTime.now();
		checkOut.setDate(localDate);
		checkOut.setStatus(CheckInStatus.CheckOut.getInt());
		return checkOut.validateCheckOut();
	}

	@Override
	public String toString() {
		return String.format("%s-%s-%s-%s-%s", name, userName, password, userType, accountStatus);
	}
}
