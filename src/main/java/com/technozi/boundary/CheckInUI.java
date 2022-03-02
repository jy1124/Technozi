package com.technozi.boundary;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.technozi.control.CheckInController;
import com.technozi.enumerated.UserType;

public class CheckInUI extends HttpServlet {
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
					// Only for Public User
					if (userType.equals(UserType.Public.toString())) {
						request.setAttribute("default", "Default");
						System.out.println("Directing to CheckInUI..");
						request.getRequestDispatcher("CheckIn.jsp").include(request, response);
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
		CheckInController cic = new CheckInController();
		String locationName = request.getParameter("checkIn");
		String searchString = request.getParameter("searchBox");

		// Check if a Check in has occurred
		if (locationName != null) {
			// If check-In success
			if (cic.requestCheckIn(session.getAttribute("username").toString(), locationName)) {
				System.out.println("Check In Success");
				String checkInResult = cic.requestLatestCheckInResult(session.getAttribute("username").toString());
				session.setAttribute("checkInResult", checkInResult);
				response.sendRedirect("CheckInCompleteUI");
			} else
				System.out.println("error!");
		} else if (!searchString.isEmpty()) { // If there is something to search
			System.out.println("Displaying List of Location..");
			List<String> locationList = cic.requestSearchedLocation(searchString);
			request.setAttribute("locationList", locationList);
			request.getRequestDispatcher("CheckIn.jsp").include(request, response);
		} else
			response.sendRedirect("CheckInUI");
	}
}
