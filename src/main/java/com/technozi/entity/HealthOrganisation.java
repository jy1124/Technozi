package com.technozi.entity;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

public class HealthOrganisation extends User {

	public boolean attemptAddAccount() {
		AccountsManagement am = new AccountsManagement();
		am.setUserName(userName);
		am.setPassword(password);
		am.setName(name);
		am.setUserType(userType);
		return am.validateAddAccount();
	}

	public boolean attemptUpdateAccount() {
		AccountsManagement am = new AccountsManagement();
		am.setUserName(userName);
		am.setPassword(password);
		am.setName(name);
		am.setUserType(userType);
		am.setAccountStatus(accountStatus);
		return am.validateUpdateAccount();
	}

	public boolean attemptSuspendAccount() {
		AccountsManagement am = new AccountsManagement();
		am.setUserName(userName);
		return am.validateSuspendAccount();
	}

	public boolean attemptUnSuspendAccount() {
		AccountsManagement am = new AccountsManagement();
		am.setUserName(userName);
		return am.validateUnSuspendAccount();
	}

	public String getUserDetails() {
		AccountsManagement am = new AccountsManagement();
		am.setUserName(userName);
		return am.queryUserDetails();
	}

	public List<String> getClusterCaseViewReport() {
		Report rp = new Report();
		return rp.queryClusterViewReport();
	}

	public List<String> getAllCaseViewReport() {
		Report rp = new Report();
		return rp.queryAllCaseViewReport();
	}

	public List<String> getDailyCaseByDateViewReport(String date) {
		Report rp = new Report();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		LocalDate localDate = LocalDate.parse(date, formatter);
		rp.setDateOfPositive(LocalDateTime.of(localDate, LocalDateTime.now().toLocalTime()));
		return rp.queryDailyCaseByDateViewReport();
	}

	public String getStatisticViewReport() {
		Report rp = new Report();
		return rp.queryStatisticViewReport();
	}

	public String getFileFormatClusterReport() {
		Report rp = new Report();
		return rp.queryFileFormatClusterReport();
	}

	public String getFileFormatAllCaseReport() {
		Report rp = new Report();
		return rp.queryFileFormatAllCaseReport();
	}

	public String getFileFormatCaseByDateReport(String date) {
		Report rp = new Report();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		LocalDate localDate = LocalDate.parse(date, formatter);
		rp.setDateOfPositive(LocalDateTime.of(localDate, LocalDateTime.now().toLocalTime()));
		return rp.queryFileFormatCaseByDateReport();
	}

	public String getFileFormatStatisticReport() {
		Report rp = new Report();
		return rp.queryFileFormatStatisticReport();
	}

	@Override
	public String toString() {
		return String.format("%s-%s-%s-%s-%s", name, userName, password, userType, accountStatus);
	}
}
