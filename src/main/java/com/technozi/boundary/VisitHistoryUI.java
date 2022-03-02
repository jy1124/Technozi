package com.technozi.boundary;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.technozi.control.VisitHistoryController;
import com.technozi.enumerated.UserType;

public class VisitHistoryUI extends HttpServlet {
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
					VisitHistoryController vhc = new VisitHistoryController();
					List<String> visitList = vhc.requestVisitHistory(session.getAttribute("username").toString());
					// Set message Record not found if list is empty
					if (visitList.isEmpty())
						request.setAttribute("noRecordMsg", "No Record Found");
					else
						request.setAttribute("visitRecord", visitList);
					// Only for public User
					if (userType.equals(UserType.Public.toString())) {
						System.out.println("Directing to VisitHistoryUI..");
						request.getRequestDispatcher("VisitHistory.jsp").forward(request, response);
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

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.sendRedirect("HomeUI"); // Redirect back to HomeUI
	}
}
