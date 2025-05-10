package user;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/user")
public class ViewUser extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ViewUser() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idParam = request.getParameter("id");

        try {
            if (idParam != null && !idParam.trim().isEmpty()) {
                UserModel user = UserDBUtil.getUserDetailsById(idParam);
                if (user != null) {
                    request.setAttribute("user", user);
                    request.getRequestDispatcher("/user.jsp").forward(request, response);
                } else {
                    response.getWriter().write("User not found with ID: " + idParam);
                }
            } else {
                List<UserModel> users = UserDBUtil.getAllUsers();
                request.setAttribute("users", users);
                request.getRequestDispatcher("/users.jsp").forward(request, response);
            }
        } catch (Exception e) {
            response.getWriter().write("Error retrieving user(s): " + e.getMessage());
            e.printStackTrace();
        }
    }
}
