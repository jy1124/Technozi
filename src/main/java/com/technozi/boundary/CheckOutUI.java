package com.technozi.boundary;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.technozi.control.CheckOutController;
import com.technozi.enumerated.UserType;

public class CheckOutUI extends HttpServlet {
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
					CheckOutController coc = new CheckOutController();
					List<String> locationList = coc.requestCheckInLocation(session.getAttribute("username").toString());
					if (locationList.isEmpty())
						request.setAttribute("noRecordMsg", "No Record Found");
					else
						request.setAttribute("locationList", locationList);
					// Only for Public User
					if (userType.equals(UserType.Public.toString())) {
						System.out.println("Directing to CheckOutUI..");
						request.getRequestDispatcher("CheckOut.jsp").include(request, response);
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
		CheckOutController coc = new CheckOutController();
		String location = request.getParameter("checkOut").trim();

		// Check if a Check-out has occurred
		if (location != null) {
			// If check-Out success
			if (coc.requestCheckOut(session.getAttribute("username").toString(), location)) {
				response.sendRedirect("CheckOutUI");
			}
		}
	}

}
