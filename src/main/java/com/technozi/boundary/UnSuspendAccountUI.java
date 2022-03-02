package com.technozi.boundary;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.technozi.control.UnSuspendAccountController;
import com.technozi.enumerated.UserType;

public class UnSuspendAccountUI extends HttpServlet {
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
						System.out.println("Directing to UnSuspendAccountUI..");
						request.getRequestDispatcher("UnsuspendAccount.jsp").include(request, response);
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
			System.out.println("Attempting to unsuspend..");
			UnSuspendAccountController usac = new UnSuspendAccountController();

			// If suspend success
			if (usac.requestUnSuspend(username)) {
				System.out.println("*User Account " + username + " is unsuspended");
				request.setAttribute("systemMessage", username + " is unsuspended.");
				request.getRequestDispatcher("UnsuspendAccount.jsp").forward(request, response);
			} else {
				System.out.println("Failed to Suspend");
				request.setAttribute("errorMsg",
						"*Failed to unsuspend " + username + ". (Please check if username is valid)");
				request.getRequestDispatcher("UnsuspendAccount.jsp").forward(request, response);
			}
		} else
			response.sendRedirect("UnSuspendAccountUI");
	}

}
