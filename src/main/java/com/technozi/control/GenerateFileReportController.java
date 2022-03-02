package com.technozi.control;

import com.technozi.entity.HealthOrganisation;

// Generate report in file format
public class GenerateFileReportController {

	public String requestFileFormatClusterReport() {
		HealthOrganisation ho = new HealthOrganisation();
		return ho.getFileFormatClusterReport();
	}

	public String requestFileFormatAllCaseReport() {
		HealthOrganisation ho = new HealthOrganisation();
		return ho.getFileFormatAllCaseReport();
	}

	public String requestFileFormatCaseByDateReport(String date) {
		HealthOrganisation ho = new HealthOrganisation();
		return ho.getFileFormatCaseByDateReport(date);
	}

	public String requestFileFormatStatisticReport() {
		HealthOrganisation ho = new HealthOrganisation();
		return ho.getFileFormatStatisticReport();
	}
}
