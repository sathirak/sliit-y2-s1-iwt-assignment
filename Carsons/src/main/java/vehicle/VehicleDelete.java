package vehicle;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/vehicle/delete")
public class VehicleDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger LOGGER = Logger.getLogger(VehicleDelete.class.getName());

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String vehicleId = request.getParameter("vehicle_id");
			
			// Input validation
			if (vehicleId == null || vehicleId.trim().isEmpty()) {
				throw new IllegalArgumentException("Vehicle ID is required");
			}
			
			boolean isSuccess = VehicleDBUtil.deletevehicle(vehicleId);

			if (isSuccess) {
				LOGGER.info("Vehicle deleted successfully with ID: " + vehicleId);
				response.sendRedirect(request.getContextPath() + "/vehicle");
			} else {
				LOGGER.warning("Failed to delete vehicle with ID: " + vehicleId);
				request.setAttribute("errorMessage", "Failed to delete the vehicle.");
				request.getRequestDispatcher("/error.jsp").forward(request, response);
			}
		} catch (IllegalArgumentException e) {
			LOGGER.log(Level.WARNING, "Invalid input for vehicle deletion", e);
			request.setAttribute("errorMessage", "Invalid input: " + e.getMessage());
			request.getRequestDispatcher("/error.jsp").forward(request, response);
		} catch (Exception e) {
			LOGGER.log(Level.SEVERE, "Error deleting vehicle", e);
			request.setAttribute("errorMessage", "Error deleting vehicle: " + e.getMessage());
			request.getRequestDispatcher("/error.jsp").forward(request, response);
		}
	}
}