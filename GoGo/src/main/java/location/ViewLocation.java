package location;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/location")
public class ViewLocation extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger LOGGER = Logger.getLogger(ViewLocation.class.getName());

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String idParam = request.getParameter("id");

        try {
            if (idParam != null && !idParam.trim().isEmpty()) {
                Location location = LocationDBUtil.getLocationDetails(idParam);
                if (location != null) {
                    LOGGER.info("Viewing location details for ID: " + idParam);
                    request.setAttribute("location", location);
                    request.getRequestDispatcher("/location.jsp").forward(request, response);
                } else {
                    LOGGER.warning("Location not found with ID: " + idParam);
                    request.setAttribute("errorMessage", "Location not found with ID: " + idParam);
                    request.getRequestDispatcher("/error.jsp").forward(request, response);
                }
            } else {
                List<Location> locations = LocationDBUtil.getAllLocations();
                LOGGER.info("Retrieving all locations. Count: " + locations.size());
                request.setAttribute("locations", locations);
                request.getRequestDispatcher("/locations.jsp").forward(request, response);
            }
        } catch (NumberFormatException e) {
            LOGGER.log(Level.WARNING, "Invalid location ID format: " + idParam, e);
            request.setAttribute("errorMessage", "Invalid location ID format");
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error retrieving location(s)", e);
            request.setAttribute("errorMessage", "Error retrieving location(s): " + e.getMessage());
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        }
    }
}
