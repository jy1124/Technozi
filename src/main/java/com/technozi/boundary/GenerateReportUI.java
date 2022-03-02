
package com.technozi.boundary;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintStream;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.technozi.control.GenerateFileReportController;
import com.technozi.control.ViewReportController;
import com.technozi.enumerated.UserType;

public class GenerateReportUI extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(); // Get session
		Cookie[] cookies = request.getCookies(); // Get all cookies

		// Authenticate with cookie and session
		if (session.getAttribute("username") != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getValue().equals(session.getAttribute("username"))) {

					String userType = session.getAttribute("userType").toString();
					// Check if user is Health Organisation
					if (userType.equals(UserType.HealthOrganisation.toString())) {
						System.out.println("Directing to GenerateReportUI..");
						request.setAttribute("default", "Default");
						request.getRequestDispatcher("GenerateReport.jsp").include(request, response);
					} else {
						System.out.println("[Invalid User Type]Directing to HomeUI..");
						response.sendRedirect("HomeUI"); // Kick to HomeUI
					}
					break;
				}
			}
		} else
			response.sendRedirect("LoginUI"); // Redirect back to LoginUI if no session found
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(); // Get session
		String report = request.getParameter("generateReport");
		String downloadClusterReport = request.getParameter("downloadClusterReport");
		String downloadCaseReport = request.getParameter("downloadCaseReport");
		String date = request.getParameter("date");
		String generateDailyCases = request.getParameter("generateDailyCases");
		String downloadDailyCaseReport = request.getParameter("downloadDailyCaseReport");
		String downloadStatisticReport = request.getParameter("downloadStatisticReport");

		if ("Generate Cluster".equals(report)) { // Generate Cluster
			System.out.println("Generating Cluster..");
			ViewReportController grc = new ViewReportController();

			List<String> clusterList = grc.requestClusterCaseViewReport();
			// If list is not empty
			if (!clusterList.isEmpty())
				request.setAttribute("clusterList", clusterList);
			else
				request.setAttribute("noRecord", "No Cluster Records");

			request.getRequestDispatcher("GenerateReport.jsp").include(request, response);
		} else if ("Generate All Cases".equals(report)) { // Generate Daily Cases
			System.out.println("Generating All Cases..");
			ViewReportController grc = new ViewReportController();

			List<String> caseList = grc.requestAllCaseViewReport();
			// If list is not empty
			if (!caseList.isEmpty())
				request.setAttribute("caseList", caseList);
			else
				request.setAttribute("noRecord", "No Record Found");
			request.getRequestDispatcher("GenerateReport.jsp").include(request, response);

		} else if ("Generate Daily Cases".equals(generateDailyCases) && !date.isEmpty()) {
			System.out.println("Generating Daily Cases..");
			ViewReportController grc = new ViewReportController();
			List<String> dailyCaseList = grc.requestDailyCaseByDateViewReport(date);

			// If list is not empty
			if (!dailyCaseList.isEmpty()) {
				session.setAttribute("selectedDate", date);
				request.setAttribute("dailyCaseList", dailyCaseList);
			} else
				request.setAttribute("noRecord", "No Record Found");
			request.getRequestDispatcher("GenerateReport.jsp").include(request, response);
		} else if ("Generate Statistics".equals(report)) {
			System.out.println("Generating Statistics Report..");
			ViewReportController grc = new ViewReportController();
			String reports = grc.requestStatisticViewReport();
			// If report is not empty
			if (!reports.isEmpty())
				request.setAttribute("reports", reports);
			else
				request.setAttribute("noRecord", "No Report Found");
			request.getRequestDispatcher("GenerateReport.jsp").include(request, response);
		} else if ("Download Cluster Report".equals(downloadClusterReport)) { // Generate Cluster In File

			File file = new File(System.getProperty("user.home"), "Cluster_Report.txt");
			GenerateFileReportController gfrc = new GenerateFileReportController();

			try (PrintStream ps = new PrintStream(file)) {
				ps.println(gfrc.requestFileFormatClusterReport()); // Generate all the cluster cases data for file
																	// download
			}
			generateFile(file, response);

		} else if ("Download Case Report".equals(downloadCaseReport)) { // Generate Daily In File
			File file = new File(System.getProperty("user.home"), "Total_Cases_Report.txt");
			GenerateFileReportController gfrc = new GenerateFileReportController();

			try (PrintStream ps = new PrintStream(file)) {
				ps.println(gfrc.requestFileFormatAllCaseReport()); // Generate all the cases data for file download
			}
			generateFile(file, response);

		} else if ("Download Daily Case Report".equals(downloadDailyCaseReport)) { // Generate Daily Cases In File
			File file = new File(System.getProperty("user.home"), "Daily_Case_Report.txt");
			GenerateFileReportController gfrc = new GenerateFileReportController();

			try (PrintStream ps = new PrintStream(file)) {
				// Generate specific day cases data for file download
				ps.println(gfrc.requestFileFormatCaseByDateReport(session.getAttribute("selectedDate").toString()));
			}
			generateFile(file, response);

		} else if ("Download Statistic Report".equals(downloadStatisticReport)) {
			// System.out.println("Generating Statistics..");
			File file = new File(System.getProperty("user.home"), "Statistic_Report.txt");
			GenerateFileReportController gfrc = new GenerateFileReportController();

			try (PrintStream ps = new PrintStream(file)) {
				ps.println(gfrc.requestFileFormatStatisticReport());
			}
			generateFile(file, response);

		} else
			response.sendRedirect("GenerateReportUI");
	}

	// Supporting function
	public void generateFile(File file, HttpServletResponse response) throws IOException {
		response.setContentType("application/octet-stream");
		response.setContentLength((int) file.length());
		response.setHeader("Content-Disposition", String.format("attachment; filename=\"%s\"", file.getName()));

		OutputStream out = response.getOutputStream();
		try (FileInputStream in = new FileInputStream(file)) {
			byte[] buffer = new byte[4096];
			int length;
			while ((length = in.read(buffer)) > 0) {
				out.write(buffer, 0, length);
			}
		}
		out.flush();
	}
}
