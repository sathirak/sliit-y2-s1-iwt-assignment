package com.vehicle;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/VehicleUpdate")
public class VehicleUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String id = request.getParameter("cusid");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String username = request.getParameter("uname");
		String password = request.getParameter("pass");

		boolean isTrue;
		isTrue = VehicleDBUtill.updatevehicle(id, name, email, phone, username, password);

		if (isTrue == true) {

			List<Vehicle> cusDetails = VehicleDBUtill.getVehicleDetails(id);
			request.setAttribute("cusDetails", cusDetails);

			RequestDispatcher dis = request.getRequestDispatcher("useraccount.jsp");
			dis.forward(request, response);
		} else {
			List<Vehicle> cusDetails = VehicleDBUtill.getVehicleDetails(id);
			request.setAttribute("cusDetails", cusDetails);

			RequestDispatcher dis = request.getRequestDispatcher("useraccount.jsp");
			dis.forward(request, response);
		}
	}

}
