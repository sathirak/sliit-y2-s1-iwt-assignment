package vehicle;

package com.vehicle;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//my me
/*@WebServlet("/VehicleReetrieve")
public class VehicleRetrieve extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

}*/

//chat
@WebServlet("/VehicleRetrieve")
public class VehicleRetrieve extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		List<Vehicle> vehicles = VehicleDBUtill.getAllVehicles();
		request.setAttribute("vehicles", vehicles);

		RequestDispatcher dispatcher = request.getRequestDispatcher("vehicledetails.jsp");
		dispatcher.forward(request, response);
	}
}
