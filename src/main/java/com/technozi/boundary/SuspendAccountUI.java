package com.technozi.boundary;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.technozi.control.SuspendAccountController;
import com.technozi.enumerated.UserType;

public class SuspendAccountUI extends HttpServlet {
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
						System.out.println("Directing to SuspendAccountUI..");
						request.getRequestDispatcher("SuspendAccount.jsp").include(request, response);
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
		String username = request.getParameter("username");
		if (!username.isEmpty()) {
			System.out.println("Attempting to suspend..");
			SuspendAccountController sac = new SuspendAccountController();

			// If suspend success
			if (sac.requestSuspendAccount(username)) {
				System.out.println("*User Account " + username + " is suspended");
				request.setAttribute("systemMessage", username + " is suspended.");
				request.getRequestDispatcher("SuspendAccount.jsp").include(request, response);
			} else {
				System.out.println("Failed to Suspend");
				request.setAttribute("errorMsg",
						"*Failed to suspend " + username + ". (Please check if username is valid)");
				request.getRequestDispatcher("SuspendAccount.jsp").include(request, response);
			}
		} else
			response.sendRedirect("SuspendAccountUI");
	}
}
