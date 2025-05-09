package location;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/location/insert")
public class InsertLocation extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger LOGGER = Logger.getLogger(InsertLocation.class.getName());
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        LOGGER.info("Displaying location insert form");
        request.getRequestDispatcher("../insertLocation.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String district = request.getParameter("district");
            String locationContactNo = request.getParameter("location_contact_no");
            String streetNo = request.getParameter("street_no");
            String street = request.getParameter("street");
            String city = request.getParameter("city");

            // Input validation
            if (district == null || district.trim().isEmpty() ||
                locationContactNo == null || locationContactNo.trim().isEmpty() ||
                streetNo == null || streetNo.trim().isEmpty() ||
                street == null || street.trim().isEmpty() ||
                city == null || city.trim().isEmpty()) {
                
                throw new IllegalArgumentException("All fields are required");
            }

            boolean isInserted = LocationDBUtil.insertLocation(district, locationContactNo, streetNo, street, city);

            if (isInserted) {
                LOGGER.info("Location created successfully: " + district + ", " + city);
                response.sendRedirect(request.getContextPath() + "/location");
            } else {
                LOGGER.warning("Location insertion failed: " + district + ", " + city);
                request.setAttribute("errorMessage", "Failed to insert location");
                request.getRequestDispatcher("../error.jsp").forward(request, response);
            }
        } catch (IllegalArgumentException e) {
            LOGGER.log(Level.WARNING, "Invalid input for location creation", e);
            request.setAttribute("errorMessage", "Invalid input: " + e.getMessage());
            request.getRequestDispatcher("../error.jsp").forward(request, response);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error creating location", e);
            request.setAttribute("errorMessage", "Error creating location: " + e.getMessage());
            request.getRequestDispatcher("../error.jsp").forward(request, response);
        }
    }
}