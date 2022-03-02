package com.technozi.boundary;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.technozi.enumerated.UserType;

public class HealthOrganisationHomeUI extends HttpServlet {
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
					// Check if user is HealthOrganisation
					if (userType.equals(UserType.HealthOrganisation.toString())) {
						System.out.println("Directing to HealthOrganisationHomeUI..");
						request.getRequestDispatcher("HealthOrganisationHome.jsp").include(request, response);
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
		String accountsManagement = request.getParameter("accountsManagement");
		String generateReport = request.getParameter("generateReport");
		if ("Accounts Management".equals(accountsManagement)) {
			System.out.println("Directing to AccountsManagementUI..");
			response.sendRedirect("AccountsManagementUI");
		} else if ("Generate Report".equals(generateReport)) {
			System.out.println("Directing to GenerateReportUI..");
			response.sendRedirect("GenerateReportUI");
		} else
			response.sendRedirect("HealthOrganisationHomeUI");
	}

}
