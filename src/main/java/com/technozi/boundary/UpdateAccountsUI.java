package com.technozi.boundary;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.technozi.control.UpdateAccountsController;
import com.technozi.enumerated.UserType;

public class UpdateAccountsUI extends HttpServlet {
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
						request.setAttribute("default", "default");
						System.out.println("Directing to UpdateAccountsUI..");
						request.getRequestDispatcher("UpdateAccounts.jsp").include(request, response);
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
		String searchValue = request.getParameter("searchBox");
		String searchBtn = request.getParameter("searchBtn");
		String update = request.getParameter("update");

		if ("searchBtn".equals(searchBtn)) {
			System.out.println("Searching...");
			UpdateAccountsController uac = new UpdateAccountsController();
			String userDetails = uac.requestUserDetails(searchValue);

			// If there is a record
			if (!userDetails.isEmpty()) {
				System.out.println("Record found");
				request.setAttribute("recordFound", "Record Found");
				request.setAttribute("userDetails", userDetails);
			} else {
				System.out.println("No Record found");
				request.setAttribute("noRecord", "No Record Found");
			}
			request.getRequestDispatcher("UpdateAccounts.jsp").include(request, response);
		} else if ("Update".equals(update)) {
			System.out.println("Updating...");
			UpdateAccountsController uac = new UpdateAccountsController();
			// If update account success
			if (uac.requestUpdateAccount(request.getParameter("name"),
					request.getParameter("username"), request.getParameter("password"),
					Integer.parseInt(request.getParameter("userType")),
					Integer.parseInt(request.getParameter("accountStatus")))) {
				System.out.println("Record Successfully Updated");
				request.setAttribute("updated", "User account details have been updated");
				request.getRequestDispatcher("UpdateAccounts.jsp").include(request, response);
			} else 
				System.out.println("Record Fail to Update");
		} else
			response.sendRedirect("UpdateAccountsUI");
	}
}
