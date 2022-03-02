package com.technozi.boundary;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.technozi.control.UpdateVaccinationStatusController;
import com.technozi.enumerated.UserType;

public class UpdateVaccinationStatusUI extends HttpServlet {
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
						UpdateVaccinationStatusController uvsc = new UpdateVaccinationStatusController();
						request.setAttribute("locationList", uvsc.requestVaccineLocation());
						request.setAttribute("nric", session.getAttribute("nric"));
						System.out.println("Directing to UpdateVaccinationStatusUI..");
						request.getRequestDispatcher("UpdateVaccinationStatus.jsp").forward(request, response);
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
		String updateVaccineRecord = request.getParameter("updateVaccineRecord");
		String vaccineType = request.getParameter("vaccineType");
		String location = request.getParameter("location");

		if ("Update Vaccine Record".equals(updateVaccineRecord)) {
			UpdateVaccinationStatusController uvsc = new UpdateVaccinationStatusController();
			String nric = (String) session.getAttribute("nric");
			// If inserted successful
			if (uvsc.attemptUpdateVaccinationStatus(nric, Integer.parseInt(vaccineType), location)) {
				System.out.println("Successfully added...Returning back..");
				response.sendRedirect("ViewVaccinationStatusUI");
			} else
				response.sendRedirect("ViewVaccinationStatusUI");
		} else
			response.sendRedirect("ViewVaccinationStatusUI");
	}
}
