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

		String vehicle_id = request.getParameter("vehicle_id");
		String category = request.getParameter("category");
		String brand = request.getParameter("brand");
		String model = request.getParameter("model");
		String plate_no = request.getParameter("plate_no");
		String color = request.getParameter("color");
		String fuel_option = request.getParameter("fuel_option");
		String gear = request.getParameter("gear");
		int seat_count = Integer.parseInt(request.getParameter("seat_count"));
		float daily_rate = Float.parseFloat(request.getParameter("daily_rate"));
		
		boolean isTrue;
		isTrue = VehicleDBUtill.updatevehicle(vehicle_id, category, brand, model, plate_no, color, fuel_option, gear, seat_count,
				daily_rate);

		if (isTrue == true) {

			List<Vehicle> cusDetails = VehicleDBUtill.getVehicleDetails(vehicle_id);
			request.setAttribute("cusDetails", cusDetails);

			RequestDispatcher dis = request.getRequestDispatcher("useraccount.jsp");
			dis.forward(request, response);
		} else {
			List<Vehicle> cusDetails = VehicleDBUtill.getVehicleDetails(vehicle_id);
			request.setAttribute("cusDetails", cusDetails);

			RequestDispatcher dis = request.getRequestDispatcher("useraccount.jsp");
			dis.forward(request, response);
		}
	}

}
