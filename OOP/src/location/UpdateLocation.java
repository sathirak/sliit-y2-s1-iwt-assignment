package location;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/location/update")
public class UpdateLocation extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String locationId = request.getParameter("location_id");
        String district = request.getParameter("district");
        String locationContactNo = request.getParameter("location_contact_no");
        String streetNo = request.getParameter("street_no");
        String street = request.getParameter("street");
        String city = request.getParameter("city");
        

        boolean isTrue;
        isTrue = LocationDBUtil.updateLocation(locationId, district, locationContactNo, streetNo, street, city);

        if (isTrue == true) {
        	
            RequestDispatcher dis = request.getRequestDispatcher("success.jsp");
            dis.forward(request, response);
            
        } else {
        	
            RequestDispatcher dis2 = request.getRequestDispatcher("unsuccess.jsp");
            dis2.forward(request, response);
        }
    }
}