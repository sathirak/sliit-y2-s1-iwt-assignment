package location;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/location/update")
public class UpdateLocation extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger LOGGER = Logger.getLogger(UpdateLocation.class.getName());

    public UpdateLocation() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String locationIdStr = request.getParameter("id");
            
            if (locationIdStr != null && !locationIdStr.trim().isEmpty()) {
                Location location = LocationDBUtil.getLocationDetails(locationIdStr);
                
                if (location != null) {
                    LOGGER.info("Fetching location update form for ID: " + locationIdStr);
                    request.setAttribute("location", location);
                    request.getRequestDispatcher("../updateLocation.jsp").forward(request, response);
                } else {
                    LOGGER.warning("Location not found for update with ID: " + locationIdStr);
                    request.setAttribute("errorMessage", "Location not found.");
                    request.getRequestDispatcher("../error.jsp").forward(request, response);
                }
            } else {
                LOGGER.warning("Invalid or missing location ID for update");
                request.setAttribute("errorMessage", "Invalid location ID.");
                request.getRequestDispatcher("../error.jsp").forward(request, response);
            }
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error retrieving location details for update", e);
            request.setAttribute("errorMessage", "Error retrieving location details: " + e.getMessage());
            request.getRequestDispatcher("../error.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String locationId = request.getParameter("location_id");
            String district = request.getParameter("district");
            String locationContactNo = request.getParameter("location_contact_no");
            String streetNo = request.getParameter("street_no");
            String street = request.getParameter("street");
            String city = request.getParameter("city");

            // Input validation
            if (locationId == null || locationId.trim().isEmpty()) {
                throw new IllegalArgumentException("Location ID is required");
            }
            
            // Validate numeric ID
            try {
                Integer.parseInt(locationId);
            } catch (NumberFormatException e) {
                throw new IllegalArgumentException("Invalid location ID format");
            }
            
            if (district == null || district.trim().isEmpty() ||
                locationContactNo == null || locationContactNo.trim().isEmpty() ||
                streetNo == null || streetNo.trim().isEmpty() ||
                street == null || street.trim().isEmpty() ||
                city == null || city.trim().isEmpty()) {
                
                throw new IllegalArgumentException("All fields are required");
            }

            boolean isUpdated = LocationDBUtil.updateLocation(locationId, district, locationContactNo, streetNo, street, city);

            if (isUpdated) {
                LOGGER.info("Location updated successfully with ID: " + locationId);
                response.sendRedirect(request.getContextPath() + "/location?id=" + locationId);
            } else {
                LOGGER.warning("Location update failed: ID = " + locationId);
                request.setAttribute("errorMessage", "Failed to update location");
                request.getRequestDispatcher("../error.jsp").forward(request, response);
            }
        } catch (IllegalArgumentException e) {
            LOGGER.log(Level.WARNING, "Invalid input for location update", e);
            request.setAttribute("errorMessage", "Invalid input: " + e.getMessage());
            request.getRequestDispatcher("../error.jsp").forward(request, response);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error updating location", e);
            request.setAttribute("errorMessage", "Error updating location: " + e.getMessage());
            request.getRequestDispatcher("../error.jsp").forward(request, response);
        }
    }
}
