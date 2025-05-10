package user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/user/delete")
public class DeleteUser extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger LOGGER = Logger.getLogger(DeleteUser.class.getName());

    public DeleteUser() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String userId = request.getParameter("id");
            
            // Input validation
            if (userId == null || userId.trim().isEmpty()) {
                throw new IllegalArgumentException("User ID is required");
            }
            
            // Validate numeric ID
            try {
                Integer.parseInt(userId);
            } catch (NumberFormatException e) {
                throw new IllegalArgumentException("Invalid user ID format");
            }
            
            UserDBUtil.deleteUser(userId);
            LOGGER.info("User deleted successfully with ID: " + userId);
            response.sendRedirect(request.getContextPath() + "/user");
        } catch (IllegalArgumentException e) {
            LOGGER.log(Level.WARNING, "Invalid input for user deletion", e);
            request.setAttribute("errorMessage", "Invalid input: " + e.getMessage());
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error deleting user", e);
            request.setAttribute("errorMessage", "Error deleting user: " + e.getMessage());
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        }
    }
}
