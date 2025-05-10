package user;

import java.io.IOException;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/user/update")
public class UpdateUser extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger LOGGER = Logger.getLogger(UpdateUser.class.getName());

    public UpdateUser() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String userIdStr = request.getParameter("id");
            if (userIdStr != null && !userIdStr.trim().isEmpty()) {
                UserModel user = UserDBUtil.getUserDetailsById(userIdStr); 
                if (user != null) {
                    LOGGER.info("Fetching user update form for ID: " + userIdStr);
                    request.setAttribute("user", user);
                    request.getRequestDispatcher("../updateUser.jsp").forward(request, response);
                } else {
                    LOGGER.warning("User not found for update with ID: " + userIdStr);
                    request.setAttribute("errorMessage", "User not found.");
                    request.getRequestDispatcher("../error.jsp").forward(request, response);
                }
            } else {
                LOGGER.warning("Invalid or missing user ID for update");
                request.setAttribute("errorMessage", "Invalid user ID.");
                request.getRequestDispatcher("../error.jsp").forward(request, response);
            }
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error retrieving user details for update", e);
            request.setAttribute("errorMessage", "Error retrieving user details: " + e.getMessage());
            request.getRequestDispatcher("../error.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String userIdStr = request.getParameter("id");
            if (userIdStr == null || userIdStr.trim().isEmpty()) {
                throw new IllegalArgumentException("User ID is required");
            }
            
            int userId = Integer.parseInt(userIdStr);
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String licenseNo = request.getParameter("licenseNo");
            String licenseExpiryDateStr = request.getParameter("licenseExpiryDate");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String contactNo = request.getParameter("contactNo");
            
            // Input validation
            if (firstName == null || firstName.trim().isEmpty() ||
                lastName == null || lastName.trim().isEmpty() ||
                email == null || email.trim().isEmpty()) {
                throw new IllegalArgumentException("Required fields cannot be empty");
            }

            Date licenseExpiryDate = Date.valueOf(licenseExpiryDateStr);
            UserModel updatedUser = new UserModel(userId, firstName, lastName, licenseNo, licenseExpiryDate, email, password, contactNo);
            UserDBUtil.updateUser(updatedUser);
            
            LOGGER.info("User updated successfully with ID: " + userId);
            response.sendRedirect(request.getContextPath() + "/user?id=" + userId);

        } catch (IllegalArgumentException e) {
            LOGGER.log(Level.WARNING, "Invalid input for user update", e);
            request.setAttribute("errorMessage", "Invalid input: " + e.getMessage());
            request.getRequestDispatcher("../error.jsp").forward(request, response);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error updating user", e);
            request.setAttribute("errorMessage", "Error updating user: " + e.getMessage());
            request.getRequestDispatcher("../error.jsp").forward(request, response);
        }
    }
}
