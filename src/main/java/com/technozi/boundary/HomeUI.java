package com.technozi.boundary;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.technozi.enumerated.UserType;

public class HomeUI extends HttpServlet {
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
					// Redirect user if user is other type
					if (userType.equals(UserType.Public.toString())) {
						System.out.println("Directing to HomeUI..");
						request.getRequestDispatcher("Home.jsp").include(request, response);
					} else if (userType.equals(UserType.Business.toString())) {
						System.out.println("[Invalid User Type]Returning to BusinessHomeUI..");
						response.sendRedirect("BusinessHomeUI");
					} else if (userType.equals(UserType.HealthStaff.toString())) {
						System.out.println("[Invalid User Type]Returning to HealthStaffHomeUI..");
						response.sendRedirect("HealthStaffHomeUI");
					} else if (userType.equals(UserType.HealthOrganisation.toString())) {
						System.out.println("[Invalid User Type]Returning to HealthOrganisationHomeUI..");
						response.sendRedirect("HealthOrganisationHomeUI");
					} else
						response.sendRedirect("LoginUI");
				}
			}
		} else
			response.sendRedirect("LoginUI"); // Redirect back to LoginUI if no session found
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String logOutAction = request.getParameter("logout");
		String vaccineAction = request.getParameter("vaccineCert");
		String visitHistory = request.getParameter("visitHistory");
		String announcement = request.getParameter("announcement");
		String checkIn = request.getParameter("checkIn");
		String checkOut = request.getParameter("checkOut");
		HttpSession session = request.getSession();

		if ("Logout".equals(logOutAction)) {
			System.out.println("Deleting...");
			Cookie[] cookies = request.getCookies();
			for (Cookie cookie : cookies) {
				if (cookie.getValue().equals(session.getAttribute("username"))) {
					cookie.setMaxAge(0);
					response.addCookie(cookie);
					System.out.println("Cookie deleted");
					session.invalidate();
					System.out.println("Session deleted");
				}
			}
			response.sendRedirect("LoginUI");
		} else if ("View Vaccine Cert".equals(vaccineAction)) {
			System.out.println("Directing to VaccineCertUI..");
			response.sendRedirect("VaccineCertUI");
		} else if ("View Past Check-Ins".equals(visitHistory)) {
			System.out.println("Directing to VisitHistoryUI..");
			response.sendRedirect("VisitHistoryUI");
		} else if ("View Announcement".equals(announcement)) {
			System.out.println("Directing to AnnouncementUI..");
			response.sendRedirect("AnnouncementUI");
		} else if ("Check In".equals(checkIn)) {
			System.out.println("Directing to CheckInUI..");
			response.sendRedirect("CheckInUI");
		} else if ("Check Out".equals(checkOut)) {
			System.out.println("Directing to CheckOutUI..");
			response.sendRedirect("CheckOutUI");
		} else {
			System.out.println("Directing to HomeUI..");
			response.sendRedirect("HomeUI");
		}
	}
}
