package com.technozi.boundary;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.technozi.control.AcknowledgeController;
import com.technozi.control.AnnouncementController;
import com.technozi.control.VaccineAnnouncementController;
import com.technozi.enumerated.UserType;

public class AnnouncementUI extends HttpServlet {
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
					// Check if user is either public or business
					if (userType.equals(UserType.Public.toString()) || userType.equals(UserType.Business.toString())) {
						List<String> announcementList = new AnnouncementController()
								.requestAnnouncement(session.getAttribute("username").toString(), userType);

						VaccineAnnouncementController vac = new VaccineAnnouncementController();
						// If vaccine cert is ready
						if (vac.getVaccineAnnouncement(session.getAttribute("username").toString()))
							request.setAttribute("vaccineReady", "Your Vaccine Certification is Ready");
						// If there is data
						if (!announcementList.isEmpty())
							request.setAttribute("announcementList", announcementList);
						System.out.println("Directing to AnnouncementUI..");
						request.getRequestDispatcher("Announcement.jsp").include(request, response);
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
		String userType = session.getAttribute("userType").toString();
		String recordID = request.getParameter("acknowledge").trim();
		System.out.println(recordID);
		if (!recordID.isEmpty()
				&& (userType.equals(UserType.Public.toString()) || userType.equals(UserType.Business.toString()))) {
			AcknowledgeController ac = new AcknowledgeController();
			ac.requestAcknowledge(recordID, userType);
			response.sendRedirect("AnnouncementUI");
		}
	}
}
