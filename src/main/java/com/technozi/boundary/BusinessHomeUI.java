package com.technozi.boundary;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.technozi.enumerated.UserType;

public class BusinessHomeUI extends HttpServlet {
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
					// Only for business User
					if (userType.equals(UserType.Business.toString())) {
						System.out.println("Directing to BusinessHomeUI..");
						request.getRequestDispatcher("BusinessHome.jsp").forward(request, response);
					} else {
						System.out.println("[Invalid User Type]Directing to HomeUI..");
						response.sendRedirect("HomeUI"); // Else Kick to HomeUI
					}
					break;
				}
			}
		} else
			response.sendRedirect("LoginUI"); // Redirect back to LoginUI if no session found
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String announcement = request.getParameter("announcement");
		String logOutAction = request.getParameter("logout");
		HttpSession session = request.getSession();
		String generateCheckIn = request.getParameter("generateCheckIn");

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
		} else if ("View Announcement".equals(announcement)) {
			System.out.println("Directing to AnnouncementUI..");
			response.sendRedirect("AnnouncementUI");
		} else if ("Generate Past Check-Ins".equals(generateCheckIn)) {
			System.out.println("Directing to BusinessGenerateCheckInUI..");
			response.sendRedirect("BusinessGenerateCheckInUI");
		} else {
			System.out.println("Directing to BusinessHomeUI..");
			response.sendRedirect("BusinessHomeUI");
		}
	}
}
