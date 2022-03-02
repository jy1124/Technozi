package com.technozi.boundary;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.technozi.control.ViewVaccinationStatusController;
import com.technozi.enumerated.UserType;

public class ViewVaccinationStatusUI extends HttpServlet {
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
						String nric = (String) session.getAttribute("nric");
						if (nric != null) {
							ViewVaccinationStatusController vvsc = new ViewVaccinationStatusController();
							String recordDetail = vvsc.requestVaccinationStatus(nric);
							request.setAttribute("recordDetail", recordDetail);
						} else // Else if this page is not returned by UpdateVaccinationStatusUI then we set as
								// default
							request.setAttribute("default", "Default");

						System.out.println("Directing to ViewVaccinationStatusUI..");
						request.getRequestDispatcher("ViewVaccinationStatus.jsp").forward(request, response);
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
		HttpSession session = request.getSession(); // Get session
		String nric = request.getParameter("NRIC");
		String editVaccinationNRIC = request.getParameter("editVaccinationNRIC");

		if (editVaccinationNRIC != null) { // Re direct
			System.out.println("Directing to UpdateVaccinationStatusUI..");
			session.setAttribute("nric", editVaccinationNRIC); // 1. The nric attribute is set once the user search it
			response.sendRedirect("UpdateVaccinationStatusUI");
		} else if (!nric.isEmpty()) { // search for NRIC and display record
			ViewVaccinationStatusController vvsc = new ViewVaccinationStatusController();
			String recordDetail = vvsc.requestVaccinationStatus(nric);

			if (!recordDetail.isEmpty()) {
				System.out.println(recordDetail);
				request.setAttribute("recordDetail", recordDetail);
			} else
				request.setAttribute("noSuchUser", "Invalid NRIC");
			System.out.println("Searching vaccination details..");
			System.out.println("Directing to ViewVaccinationStatusUI..");
			request.getRequestDispatcher("ViewVaccinationStatus.jsp").forward(request, response);
		} else { // Refresh
			System.out.println("Directing to ViewVaccinationStatusUI..");
			response.sendRedirect("ViewVaccinationStatusUI");
		}
	}
}
