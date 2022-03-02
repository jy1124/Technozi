package com.technozi.boundary;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.technozi.control.LoginController;
import com.technozi.enumerated.LoginStatus;

public class LoginUI extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("Login.jsp").forward(request, response);
	}

	// Post Request
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		LoginController lc = new LoginController();

		// Login Success
		int login_Flag = lc.attemptLogin(request.getParameter("username"), request.getParameter("password"));

		if (login_Flag == LoginStatus.SUCESS_LOGIN.getInt()) {
			HttpSession session = request.getSession();
			Cookie cookie = new Cookie("username", request.getParameter("username"));
			cookie.setMaxAge(1800);
			response.addCookie(cookie);

			String userTypeAndName = lc.checkUserTypeAndName(request.getParameter("username"));
			String[] userTypeAndNameArr = userTypeAndName.split("`");
			session.setAttribute("username", request.getParameter("username"));
			session.setAttribute("userType", userTypeAndNameArr[0]);
			session.setAttribute("name", userTypeAndNameArr[1]);

			response.sendRedirect("HomeUI");
		} else if (login_Flag == LoginStatus.WRONG_CREDENTIALS.getInt()) {
			request.setAttribute("errorMsg", "*Invalid Username Or Password");
			request.getRequestDispatcher("Login.jsp").include(request, response);
		} else if (login_Flag == LoginStatus.INACTIVE.getInt()) {
			request.setAttribute("errorMsg", "*Account is not activated, please contact admin.");
			request.getRequestDispatcher("Login.jsp").include(request, response);
		} else if (login_Flag == LoginStatus.SUSPENDED.getInt()) {
			request.setAttribute("errorMsg", "*Account has been suspended");
			request.getRequestDispatcher("Login.jsp").include(request, response);
		} else if (login_Flag == LoginStatus.ERROR.getInt()) {
			request.setAttribute("errorMsg", "*Error. Try again");
			request.getRequestDispatcher("Login.jsp").include(request, response);
		}
	}
}
