package com.technozi.boundary;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.technozi.control.GenerateAnnouncementController;
import com.technozi.enumerated.UserType;

public class SendAnnouncementUI extends HttpServlet {
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
					// Check if user is Health Staff
					if (userType.equals(UserType.HealthStaff.toString())) {
						System.out.println("Directing to SendAnnouncementUI..");
						request.getRequestDispatcher("SendAnnouncement.jsp").include(request, response);
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
		String id = request.getParameter("id");
		if (!id.isEmpty()) {
			GenerateAnnouncementController gac = new GenerateAnnouncementController();
			// If success
			if (gac.requestGenerateAnnouncement(id, session.getAttribute("username").toString())) {
				request.setAttribute("sysMsg", "Successfully Generated");
				request.getRequestDispatcher("SendAnnouncement.jsp").include(request, response);
			} else {
				System.out.println("No such username (MAIN)");
				request.setAttribute("sysMsg", "Invalid NRIC");
				request.getRequestDispatcher("SendAnnouncement.jsp").include(request, response);
			}
		} else
			response.sendRedirect("SendAnnouncementUI");
	}

}
