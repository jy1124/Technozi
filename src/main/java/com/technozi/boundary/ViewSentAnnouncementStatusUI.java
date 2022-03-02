package com.technozi.boundary;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.technozi.control.ViewSentAnnouncementStatusController;
import com.technozi.enumerated.UserType;

public class ViewSentAnnouncementStatusUI extends HttpServlet {
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
					// Only for Health Staff User
					if (userType.equals(UserType.HealthStaff.toString())) {
						ViewSentAnnouncementStatusController vsasc = new ViewSentAnnouncementStatusController();
						List<String> sentAnnouncementList = vsasc
								.requestGeneratedAnnouncement(session.getAttribute("username").toString());
						// If list is not empty, set list attribute
						if (!sentAnnouncementList.isEmpty())
							request.setAttribute("sentAnnouncementList", sentAnnouncementList);
						else
							request.setAttribute("noRecords", "Record Not Found");
						System.out.println("Directing to ViewSentAnnouncementStatusUI..");
						request.getRequestDispatcher("ViewSentAnnouncementStatus.jsp").forward(request, response);
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
		response.sendRedirect("ViewSentAnnouncementStatusUI");
	}

}
