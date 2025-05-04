package location;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/ViewLocation")
public class ViewLocation extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
        List<Location> locations = LocationDBUtil.getAllLocations();
        request.setAttribute("locations", locations);

        RequestDispatcher dispatcher = request.getRequestDispatcher("locationdetails.jsp");
        dispatcher.forward(request, response);
    }
}