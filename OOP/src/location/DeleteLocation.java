package location;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeleteLocation")
public class DeleteLocation extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String id = request.getParameter("locationId");
        boolean isTrue;

        isTrue = LocationDBUtil.deleteLocation(id);

        if (isTrue == true) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("locationinsert.jsp");
            dispatcher.forward(request, response);
        } else {
            List<Location> locDetails = LocationDBUtil.getLocationDetails(id);
            request.setAttribute("locDetails", locDetails);

            RequestDispatcher dispatcher = request.getRequestDispatcher("location.jsp");
            dispatcher.forward(request, response);
        }
    }
}