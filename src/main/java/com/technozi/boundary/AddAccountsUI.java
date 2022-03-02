package com.technozi.boundary;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.technozi.control.AddAccountsController;
import com.technozi.enumerated.UserType;

public class AddAccountsUI extends HttpServlet {
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
					if (userType.equals(UserType.HealthOrganisation.toString())) {
						System.out.println("Directing to AddAccountsUI..");
						request.getRequestDispatcher("AddAccounts.jsp").include(request, response);
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
		String addUserBtn = request.getParameter("addUser");
		String name = request.getParameter("name");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String userType = request.getParameter("userType");

		if ("Add User".equals(addUserBtn)) {
			System.out.println("Try Inserting ...");
			AddAccountsController aac = new AddAccountsController();

			if (name.isEmpty() || username.isEmpty() || password.isEmpty()) {
				System.out.println("No credentials..");
				request.setAttribute("insertion", "All fields cannot be left empty");
				request.getRequestDispatcher("AddAccounts.jsp").include(request, response);
			} else {
				if (aac.requestAddAccount(name, username, password, Integer.parseInt(userType))) {
					System.out.println("Add account success..");
					request.setAttribute("insertion", "Account has been successfully added");
				} else {
					System.out.println("Add account fail..");
					request.setAttribute("insertion", "Failed to Add Account: Existing User ID");
				}
				request.getRequestDispatcher("AddAccounts.jsp").include(request, response);
			}
		} else
			response.sendRedirect("AddAccountsUI");
	}
}
