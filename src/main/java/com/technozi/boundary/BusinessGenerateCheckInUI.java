package com.technozi.boundary;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.technozi.control.BusinessVisitHistoryController;
import com.technozi.enumerated.UserType;

public class BusinessGenerateCheckInUI extends HttpServlet {
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
					// Only Business User can access
					if (userType.equals(UserType.Business.toString())) {
						System.out.println("Directing to BusinessGenerateCheckInUI..");
						request.setAttribute("default", "Default");
						request.getRequestDispatcher("BusinessGenerateCheckIn.jsp").forward(request, response);
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
		HttpSession session = request.getSession();
		String date = request.getParameter("date");
		String username = session.getAttribute("username").toString();

		if (!date.isEmpty()) {
			BusinessVisitHistoryController bvhc = new BusinessVisitHistoryController();
			List<String> generateList = bvhc.requestBusinessVisitHistory(username, date);

			// Set message if no record found
			if (!generateList.isEmpty())
				request.setAttribute("generateList", generateList);
			request.getRequestDispatcher("BusinessGenerateCheckIn.jsp").forward(request, response);
		} else
			response.sendRedirect("BusinessGenerateCheckInUI");
	}
}
