package location;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/location/delete")
public class DeleteLocation extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger LOGGER = Logger.getLogger(DeleteLocation.class.getName());
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String id = request.getParameter("id");
            
            // Input validation
            if (id == null || id.trim().isEmpty()) {
                throw new IllegalArgumentException("Location ID is required");
            }
            
            // Validate numeric ID
            try {
                Integer.parseInt(id);
            } catch (NumberFormatException e) {
                throw new IllegalArgumentException("Invalid location ID format");
            }
            
            boolean isDeleted = LocationDBUtil.deleteLocation(id);
            
            if (isDeleted) {
                LOGGER.info("Location deleted successfully with ID: " + id);
                response.sendRedirect(request.getContextPath() + "/location");
            } else {
                LOGGER.warning("Location deletion failed: ID = " + id);
                request.setAttribute("errorMessage", "Failed to delete location, it may not exist.");
                request.getRequestDispatcher("../error.jsp").forward(request, response);
            }
        } catch (IllegalArgumentException e) {
            LOGGER.log(Level.WARNING, "Invalid input for location deletion", e);
            request.setAttribute("errorMessage", "Invalid input: " + e.getMessage());
            request.getRequestDispatcher("../error.jsp").forward(request, response);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error deleting location", e);
            request.setAttribute("errorMessage", "Error deleting location: " + e.getMessage());
            request.getRequestDispatcher("../error.jsp").forward(request, response);
        }
    }
}