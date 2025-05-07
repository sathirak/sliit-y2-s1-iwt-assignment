package vehicle;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/VehicleDelete")
public class VehicleDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String vehicleId = request.getParameter("vehicle_id");

		boolean isTrue = VehicleDBUtil.deletevehicle(vehicleId);

		if (isTrue) {
			List<Vehicle> updatedVehicles = VehicleDBUtil.getAllVehicles();
			request.setAttribute("vehicles", updatedVehicles);
			request.setAttribute("successMsg", "Vehicle deleted successfully.");

			RequestDispatcher dis = request.getRequestDispatcher("vehiclelist.jsp");
			dis.forward(request, response);
		} else {
			request.setAttribute("errorMsg", "Failed to delete the vehicle.");
			RequestDispatcher dis2 = request.getRequestDispatcher("vehiclelist.jsp");
			dis2.forward(request, response);
		}
	}
}