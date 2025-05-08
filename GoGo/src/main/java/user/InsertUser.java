package user;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/user/insert")
public class InsertUser extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger LOGGER = Logger.getLogger(InsertUser.class.getName());
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        LOGGER.info("Displaying user insert form");
        request.getRequestDispatcher("/insertUser.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String licenseNo = request.getParameter("licenseNo");
            String licenseExpiry = request.getParameter("licenseExpiryDate");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String contactNo = request.getParameter("contactNo");

            // Input validation
            if (firstName == null || firstName.trim().isEmpty() ||
                lastName == null || lastName.trim().isEmpty() ||
                email == null || email.trim().isEmpty() ||
                password == null || password.trim().isEmpty() ||
                licenseExpiry == null || licenseExpiry.trim().isEmpty()) {
                throw new IllegalArgumentException("Required fields cannot be empty");
            }

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date utilDate = sdf.parse(licenseExpiry);
            Date sqlDate = new Date(utilDate.getTime());

            UserModel user = new UserModel(firstName, lastName, licenseNo, sqlDate, email, password, contactNo);
            UserDBUtil.insertUser(user);
            
            LOGGER.info("User created successfully: " + email);
            response.sendRedirect(request.getContextPath() + "/user");
        } catch (IllegalArgumentException e) {
            LOGGER.log(Level.WARNING, "Invalid input for user creation", e);
            request.setAttribute("errorMessage", "Invalid input: " + e.getMessage());
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error creating user", e);
            request.setAttribute("errorMessage", "Error creating user: " + e.getMessage());
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        }
    }
}
