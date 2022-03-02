package com.technozi.boundary;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.technozi.enumerated.UserType;

public class AccountsManagementUI extends HttpServlet {
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

						System.out.println("Directing to AccountsManagementUI..");
						request.getRequestDispatcher("AccountsManagement.jsp").include(request, response);
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
		String addAccount = request.getParameter("addAccount");
		String updateAccount = request.getParameter("updateAccount");
		String suspendAccount = request.getParameter("suspendAccount");
		String unsuspendAccount = request.getParameter("unsuspendAccount");

		if ("Add Account".equals(addAccount)) {
			System.out.println("Directing to AddAccountsUI..");
			response.sendRedirect("AddAccountsUI");
		} else if ("Update Account".equals(updateAccount)) {
			System.out.println("Directing to UpdateAccountsUI..");
			response.sendRedirect("UpdateAccountsUI");
		} else if ("Suspend Account".equals(suspendAccount)) {
			System.out.println("Directing to SuspendAccountUI..");
			response.sendRedirect("SuspendAccountUI");
		} else if ("UnSuspend Account".equals(unsuspendAccount)) {
			System.out.println("Directing to UnSuspendAccountUI..");
			response.sendRedirect("UnSuspendAccountUI");
		} else
			response.sendRedirect("AccountsManagementUI");
	}
}
