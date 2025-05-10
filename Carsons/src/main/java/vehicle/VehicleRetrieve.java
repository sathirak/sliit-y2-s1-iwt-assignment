package vehicle;

import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/vehicle")
public class VehicleRetrieve extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger LOGGER = Logger.getLogger(VehicleRetrieve.class.getName());

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String vehicleId = request.getParameter("id");
			
			if (vehicleId != null && !vehicleId.trim().isEmpty()) {
				// Single vehicle view
				Vehicle vehicleDetails = VehicleDBUtil.getVehicleDetails(vehicleId);
				if (vehicleDetails != null) {
					LOGGER.info("Fetching vehicle details for ID: " + vehicleId);
					request.setAttribute("vehDetails", vehicleDetails);
					request.getRequestDispatcher("/vehicle.jsp").forward(request, response);
				} else {
					LOGGER.warning("Vehicle not found with ID: " + vehicleId);
					request.setAttribute("errorMessage", "Vehicle not found with ID: " + vehicleId);
					request.getRequestDispatcher("/error.jsp").forward(request, response);
				}
			} else {
				// All vehicles view
				LOGGER.info("Fetching all vehicles");
				List<Vehicle> vehicles = VehicleDBUtil.getAllVehicles();
				request.setAttribute("vehicles", vehicles);

				request.getRequestDispatcher("/vehicles.jsp").forward(request, response);
			}
		} catch (Exception e) {
			LOGGER.log(Level.SEVERE, "Error retrieving vehicle data", e);
			request.setAttribute("errorMessage", "Error retrieving vehicle data: " + e.getMessage());
			request.getRequestDispatcher("/error.jsp").forward(request, response);
		}
	}
}
