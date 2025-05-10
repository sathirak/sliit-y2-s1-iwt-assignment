package vehicle;

import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/vehicle/all")
public class VehicleRetrieveAll extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger LOGGER = Logger.getLogger(VehicleRetrieveAll.class.getName());
       
    public VehicleRetrieveAll() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			LOGGER.info("Fetching all vehicles");
			List<Vehicle> vehicles = VehicleDBUtil.getAllVehicles();
			request.setAttribute("vehicles", vehicles);
			
			request.getRequestDispatcher("/vehicleAll.jsp").forward(request, response);
		} catch (Exception e) {
			LOGGER.log(Level.SEVERE, "Error retrieving all vehicles", e);
			request.setAttribute("errorMessage", "Error retrieving vehicle data: " + e.getMessage());
			request.getRequestDispatcher("/error.jsp").forward(request, response);
		}
	}
}
