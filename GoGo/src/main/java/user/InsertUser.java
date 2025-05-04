package user;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/user/insert")
public class InsertUser extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Retrieving form parameters
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String licenseNo = request.getParameter("licenseNo");
        String licenseExpiry = request.getParameter("licenseExpiryDate");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String contactNo = request.getParameter("contactNo");

        try {
            // Convert license expiry date to SQL Date
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date utilDate = sdf.parse(licenseExpiry);
            Date sqlDate = new Date(utilDate.getTime());

            // Create a UserModel object with the retrieved data
            UserModel user = new UserModel(0, firstName, lastName, licenseNo, sqlDate, email, password, contactNo);

            // Pass the UserModel object to the insertUser method
            UserDBUtil.insertUser(user);

            // Redirect to success page
            response.sendRedirect(request.getContextPath() + "/user/success.jsp");

        } catch (Exception e) {
            // Handle exceptions and redirect to error page
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/user/error.jsp");
        }
    }
}
