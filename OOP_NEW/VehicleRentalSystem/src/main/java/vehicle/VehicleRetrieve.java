package vehicle;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/VehicleRetrieve")
public class VehicleRetrieve extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		List<Vehicle> vehicles = VehicleDBUtil.getAllVehicles();
		request.setAttribute("vehicles", vehicles);

		RequestDispatcher dispatcher = request.getRequestDispatcher("vehiclelist.jsp"); // vehicledetails.jsp
		dispatcher.forward(request, response);
	}
}
