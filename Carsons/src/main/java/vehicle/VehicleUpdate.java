package vehicle;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/vehicle/update")
public class VehicleUpdate extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger LOGGER = Logger.getLogger(VehicleUpdate.class.getName());

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String vehicleIdStr = request.getParameter("id");
            
            if (vehicleIdStr != null && !vehicleIdStr.trim().isEmpty()) {
                Vehicle vehicle = VehicleDBUtil.getVehicleDetails(vehicleIdStr);
                
                if (vehicle != null) {
                    LOGGER.info("Fetching vehicle update form for ID: " + vehicleIdStr);
                    request.setAttribute("vehicle", vehicle);
                    request.getRequestDispatcher("../updatevehicle.jsp").forward(request, response);
                } else {
                    LOGGER.warning("Vehicle not found for update with ID: " + vehicleIdStr);
                    request.setAttribute("errorMessage", "Vehicle not found.");
                    request.getRequestDispatcher("../error.jsp").forward(request, response);
                }
            } else {
                LOGGER.warning("Invalid or missing vehicle ID for update");
                request.setAttribute("errorMessage", "Invalid vehicle ID.");
                request.getRequestDispatcher("../error.jsp").forward(request, response);
            }
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error retrieving vehicle details for update", e);
            request.setAttribute("errorMessage", "Error retrieving vehicle details: " + e.getMessage());
            request.getRequestDispatcher("../error.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String vehicle_id = request.getParameter("vehicle_id");
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
            if (vehicle_id == null || vehicle_id.trim().isEmpty()) {
                throw new IllegalArgumentException("Vehicle ID is required");
            }
            
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

            boolean isSuccess = VehicleDBUtil.updatevehicle(vehicle_id, category, model, brand, gear, color, seat_no, fuel_option,
                    plate_no, daily_rate);

            if (isSuccess) {
                LOGGER.info("Vehicle updated successfully with ID: " + vehicle_id);
                response.sendRedirect(request.getContextPath() + "/vehicle");
            } else {
                LOGGER.warning("Failed to update vehicle with ID: " + vehicle_id);
                request.setAttribute("errorMsg", "Vehicle update failed. Please try again.");
                request.getRequestDispatcher("../error.jsp").forward(request, response);
            }
            
        } catch (IllegalArgumentException e) {
            LOGGER.log(Level.WARNING, "Invalid input for vehicle update", e);
            request.setAttribute("errorMsg", "Invalid input: " + e.getMessage());
            request.getRequestDispatcher("../error.jsp").forward(request, response);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error updating vehicle", e);
            request.setAttribute("errorMsg", "Error updating vehicle: " + e.getMessage());
            request.getRequestDispatcher("../error.jsp").forward(request, response);
        }
    }
}
