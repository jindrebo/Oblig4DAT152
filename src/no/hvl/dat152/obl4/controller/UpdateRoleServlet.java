package no.hvl.dat152.obl4.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import no.hvl.dat152.obl4.database.AppUser;
import no.hvl.dat152.obl4.database.AppUserDAO;
import no.hvl.dat152.obl4.util.Role;
import no.hvl.dat152.obl4.util.Validator;

@WebServlet("/updaterole")
public class UpdateRoleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("token", request.getSession().getAttribute("token"));
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		request.removeAttribute("message");
		request.setAttribute("token", request.getSession().getAttribute("token"));

		boolean successfulRoleUpdate = false;
		
		String username = Validator.validString(request
				.getParameter("username"));
		String newrole = Validator.validString(request
				.getParameter("role"));
		
		AppUser user = (AppUser) request.getSession().getAttribute("user");
		
		if(username != null) {
			
			if (RequestHelper.isLoggedIn(request) && user.getRole().equals(Role.ADMIN.toString()) && RequestHelper.CRSF(request)) {
				
				AppUserDAO userDAO = new AppUserDAO();
				
				successfulRoleUpdate = userDAO.updateUserRole(username, newrole);
				
				if (successfulRoleUpdate) {
					
					response.sendRedirect("mydetails");

				} else {
					request.setAttribute("message", "Role update for "+username+" failed!");
					request.getRequestDispatcher("updaterole.jsp").forward(request,
							response);
				}
				
			} else {
				request.getSession().invalidate();
				request.setAttribute("message", "You are not authorized to perform this action!");
				request.getRequestDispatcher("login.jsp").forward(request,
						response);
			}
		}


	}

}
