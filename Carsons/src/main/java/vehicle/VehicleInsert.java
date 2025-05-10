package vehicle;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/vehicle/insert")
public class VehicleInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger LOGGER = Logger.getLogger(VehicleInsert.class.getName());

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		LOGGER.info("Displaying vehicle insert form");
		RequestDispatcher dis = request.getRequestDispatcher("/insertvehicle.jsp");
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String category = request.getParameter("category");
			String model = request.getParameter("model");
			String brand = request.getParameter("brand");
			String gear = request.getParameter("gear");
			String color = request.getParameter("color");
			String seatNoStr = request.getParameter("seat_no");
			String fuel_option = request.getParameter("fuel_option");
			String plate_no = request.getParameter("plate_no");
			String dailyRateStr = request.getParameter("daily_rate");

			// Input validation
			if (category == null || category.trim().isEmpty() ||
				model == null || model.trim().isEmpty() ||
				brand == null || brand.trim().isEmpty()) {
				throw new IllegalArgumentException("Required fields cannot be empty");
			}

			if (!plate_no.matches("^[A-Z]{2,3}[-\\s][0-9]{4}$")) {
				throw new IllegalArgumentException("Invalid plate number format. Use e.g., AB-1234 or ABC 5678");
			}

			int seat_no = Integer.parseInt(seatNoStr);
			float daily_rate = Float.parseFloat(dailyRateStr);

			boolean isSuccess = VehicleDBUtil.insertvehicle(category, model, brand, gear, color, seat_no, fuel_option, plate_no,
					daily_rate);

			if (isSuccess) {
				LOGGER.info("Vehicle inserted successfully: " + brand + " " + model);
				response.sendRedirect(request.getContextPath() + "/vehicle");
			} else {
				LOGGER.warning("Failed to insert vehicle: " + brand + " " + model);
				request.setAttribute("errorMessage", "Failed to add vehicle.");
				request.getRequestDispatcher("/error.jsp").forward(request, response);
			}

		} catch (IllegalArgumentException e) {
			LOGGER.log(Level.WARNING, "Invalid input for vehicle creation", e);
			request.setAttribute("errorMessage", "Invalid input: " + e.getMessage());
			request.getRequestDispatcher("/error.jsp").forward(request, response);
		} catch (Exception e) {
			LOGGER.log(Level.SEVERE, "Error creating vehicle", e);
			request.setAttribute("errorMessage", "Error creating vehicle: " + e.getMessage());
			request.getRequestDispatcher("/error.jsp").forward(request, response);
		}
	}
}
