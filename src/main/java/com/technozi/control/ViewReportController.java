package com.technozi.control;

import java.util.List;

import com.technozi.entity.HealthOrganisation;

// Generate report in table format
public class ViewReportController {

	public List<String> requestClusterCaseViewReport() {
		HealthOrganisation ho = new HealthOrganisation();
		return ho.getClusterCaseViewReport();
	}

	public List<String> requestAllCaseViewReport() {
		HealthOrganisation ho = new HealthOrganisation();
		return ho.getAllCaseViewReport();
	}

	public List<String> requestDailyCaseByDateViewReport(String date) {
		HealthOrganisation ho = new HealthOrganisation();
		return ho.getDailyCaseByDateViewReport(date);
	}

	public String requestStatisticViewReport() {
		HealthOrganisation ho = new HealthOrganisation();
		return ho.getStatisticViewReport();
	}
}
